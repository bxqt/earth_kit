package de.bendix.earth_kit.opengl.buffers

import android.opengl.GLES30.*
import android.os.Build
import android.util.Log
import androidx.annotation.RequiresApi
import de.bendix.earth_kit.opengl.allocateFloats

@RequiresApi(Build.VERSION_CODES.JELLY_BEAN_MR2)
class ArrayTexture : Bindable {
    private var id = 0

    override fun create() {
        id = IntArray(1).also { glGenTextures(1, it, 0) }[0]
    }

    fun setTextures(textures: List<List<List<Float>>>) {
        glActiveTexture(GL_TEXTURE0)
        bind()

        if (textures.isEmpty()) {
            glTexStorage3D(GL_TEXTURE_2D_ARRAY, 1, GL_R32F, 1, 1, 0)
        } else {
            val width = textures[0][0].size
            val height = textures[0].size
            val count = textures.size

            glTexStorage3D(GL_TEXTURE_2D_ARRAY, 1, GL_R32F, width, height, count)

            val data = FloatArray(height * width * count)
            textures.forEachIndexed { i, texture ->
                for (y in 0 until height) {
                    for (x in 0 until width) {
                        val index = (i * width * height) + (y * width + x)
                        data[index] = texture[y][x]
                    }
                }
            }

            glTexSubImage3D(
                GL_TEXTURE_2D_ARRAY,
                0, 0, 0, 0,
                width, height, count,
                GL_RED, GL_FLOAT,
                allocateFloats(data)
            )
        }

        glTexParameteri(GL_TEXTURE_2D_ARRAY, GL_TEXTURE_MIN_FILTER, GL_LINEAR)
        glTexParameteri(GL_TEXTURE_2D_ARRAY, GL_TEXTURE_MAG_FILTER, GL_LINEAR)
        glTexParameteri(GL_TEXTURE_2D_ARRAY, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE)
        glTexParameteri(GL_TEXTURE_2D_ARRAY, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE)
    }

    override fun bind() = glBindTexture(GL_TEXTURE_2D_ARRAY, id)
    override fun unbind() = glBindTexture(GL_TEXTURE_2D_ARRAY, 0)
    override fun free() = glDeleteTextures(1, intArrayOf(id), 0)
}