package de.bendix.earth_kit.opengl.renderer.projections

// A shader map projection must have two methods: project and invert,
// where the interface for the project function looks like this:
//
// vec2 project(vec2 origin, vec2 latLng)
//
// and
//
// vec2 invert(vec2 origin, vec2 offset)
//
// for the invert function. If a coordinate or an offset cannot be projected
// or inverted, the function should return the outsideProjection constant which is
// defined as:
//
// const vec2 outsideProjection = vec2(9999.0, -9999.0);
//
// Every shader must define this constant.

data class Projection(
    val project: String,
    val invert: String
) {
    companion object {
        fun parse(src: String) : Projection {
            return when(src) {
                "orthographic" -> ORTHOGRAPHIC_PROJECTION
                else -> ORTHOGRAPHIC_PROJECTION
            }
        }
    }
}