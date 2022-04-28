package de.bendix.earth_kit.opengl.util

import androidx.annotation.Keep

@Keep
data class EarthState(
    val size: Size,
    val parentSize: Size,
    val origin: LatLng,
    val isMoving: Boolean
)

@Keep
data class LatLng(
    val latitude: Float,
    val longitude: Float
)

@Keep
data class Size(
    val width: Float,
    val height: Float
)