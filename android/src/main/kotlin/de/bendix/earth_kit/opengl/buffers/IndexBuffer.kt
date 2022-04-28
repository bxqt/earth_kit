package de.bendix.earth_kit.opengl.buffers

import android.opengl.GLES30.*
import android.os.Build
import android.util.Log
import androidx.annotation.RequiresApi
import de.bendix.earth_kit.opengl.allocateShorts

@RequiresApi(Build.VERSION_CODES.JELLY_BEAN_MR2)
class IndexBuffer : Bindable {
    private var id = 0

    override fun create() {
        id = IntArray(1).also { glGenBuffers(1, it, 0) }[0]
    }

    fun setIndices(indices: ShortArray) {
        bind()
        glBufferData(GL_ELEMENT_ARRAY_BUFFER, indices.size * 2, allocateShorts(indices), GL_STATIC_DRAW)
    }

    override fun bind() = glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, id)
    override fun unbind() = glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0)
    override fun free() = glDeleteBuffers(1, intArrayOf(id), 0)
}