package de.bendix.earth_kit.opengl.buffers

import android.opengl.GLES30.*
import android.os.Build
import android.util.Log
import androidx.annotation.RequiresApi

@RequiresApi(Build.VERSION_CODES.JELLY_BEAN_MR2)
class VertexArray : Bindable {
    private var id = 0
    private var elements = 0

    override fun create() {
        elements = 0
        id = IntArray(1).also { glGenVertexArrays(1, it, 0) }[0]
    }

    fun addBuffer(vararg layout: VertexBufferLayoutElement) {
        bind()
        var offset = 0
        val totalStride = layout.sumBy { it.stride }

        for (i in layout.indices) {
            val element = layout[i]
            val index = elements + i
            glVertexAttribPointer(index, element.count, element.type, element.normalized, totalStride, offset)
            glEnableVertexAttribArray(index)
            offset += element.stride
        }

        elements += layout.size
    }

    fun reset() {
        for (i in 0 until elements) {
            glDisableVertexAttribArray(i)
        }

        elements = 0
    }

    override fun bind() = glBindVertexArray(id)
    override fun unbind() = glBindVertexArray(0)
    override fun free() = glDeleteVertexArrays(1, intArrayOf(id), 0)
}

fun floats(count: Int): VertexBufferLayoutElement {
    return VertexBufferLayoutElement(GL_FLOAT, count, false)
}

fun ints(count: Int): VertexBufferLayoutElement {
    return VertexBufferLayoutElement(GL_SHORT, count, false)
}

data class VertexBufferLayoutElement(
    val type: Int,
    val count: Int,
    val normalized: Boolean
) {
    val size: Int = when (type) {
        GL_FLOAT -> 4
        GL_UNSIGNED_SHORT -> 2
        else -> 1
    }

    val stride: Int
        get() = count * size
}