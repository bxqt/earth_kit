package de.bendix.earth_kit.opengl.buffers

interface Bindable {
    fun create()
    fun bind()
    fun unbind()
    fun free()
}