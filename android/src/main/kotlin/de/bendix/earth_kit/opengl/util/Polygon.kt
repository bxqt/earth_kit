package de.bendix.earth_kit.opengl.util

import androidx.annotation.Keep

@Keep
data class Polygon(
    val id: String,
    val vertices: List<LatLng>,
    val colorVec: List<Float>,
    val strokeColorVec: List<Float>,
    val strokeWidth: Float
) {
    val color = ColorVec(colorVec)
    val strokeColor = ColorVec(strokeColorVec)

    override fun equals(other: Any?): Boolean {
        return other is Polygon && id == other.id
    }

    override fun hashCode(): Int {
        return id.hashCode()
    }
}