package de.bendix.earth_kit.opengl

import android.opengl.GLES20.*

class Shader {
    private var vertexShader = 0
    private var fragmentShader = 0
    private var id = 0

    private val uniformCache: HashMap<String, Int> = HashMap()

    fun compile(vertexShader: String, fragmentShader: String) {
        uniformCache.clear()

        this.vertexShader = loadShader(GL_VERTEX_SHADER, vertexShader)
        this.fragmentShader = loadShader(GL_FRAGMENT_SHADER, fragmentShader)

        id = glCreateProgram()
        glAttachShader(id, this.vertexShader)
        glAttachShader(id, this.fragmentShader)
        glLinkProgram(id)

        glDeleteShader(this.vertexShader)
        glDeleteShader(this.fragmentShader)

        use()
    }

    fun use() = glUseProgram(id)
    fun free() = glDeleteProgram(id)

    fun set1i(name: String, value: Int) = glUniform1i(uniform(name), value)
    fun set1f(name: String, value: Float) = glUniform1f(uniform(name), value)
    fun set2f(name: String, v0: Float, v1: Float) = glUniform2f(uniform(name), v0, v1)
    fun set3f(name: String, v0: Float, v1: Float, v2: Float) = glUniform3f(uniform(name), v0, v1, v2)
    fun set4f(name: String, v0: Float, v1: Float, v2: Float, v3: Float) = glUniform4f(uniform(name), v0, v1, v2, v3)

    fun set1fv(name: String, values: FloatArray) = glUniform1fv(uniform(name), values.size, allocateFloats(values))
    fun set4fv(name: String, values: List<FloatArray>) {
        for (i in values.indices) {
            val vector = values[i]
            set4f("$name[$i]", vector[0], vector[1], vector[2], vector[3])
        }
    }

    private fun uniform(name: String) = uniformCache[name] ?: glGetUniformLocation(id, name)

    private fun attribLocation(name: String) = glGetAttribLocation(id, name)

    private fun loadShader(type: Int, code: String): Int {
        return glCreateShader(type).also { shader ->
            glShaderSource(shader, code)
            glCompileShader(shader)
        }
    }
}