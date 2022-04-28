package de.bendix.earth_kit.opengl.util

import androidx.annotation.Keep

@Keep
data class ColorVec(
    val color: List<Float>
)  {
    val red: Float
        get() = color[0]

    val green: Float
        get() = color[1]

    val blue: Float
        get() = color[2]

    val alpha: Float
        get() = color[3]

    val isVisible: Boolean
        get() = alpha > 0
}

@Keep
data class ColorStop(
    val value: Float,
    val color: List<Float>
)