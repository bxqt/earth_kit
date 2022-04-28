package de.bendix.earth_kit.opengl.renderer.projections

internal val ORTHOGRAPHIC_PROJECT = """
    vec2 project(vec2 origin, vec2 latLng) {
        float lat = latLng.x;
        float lon = latLng.y;
        float lat0 = origin.x;
        float lon0 = origin.y;
        
        float c = sin(lat0) * sin(lat) + cos(lat0) * cos(lat) * cos(lon - lon0);
        if (c < 0.0) {
            return outsideProjection;
        }
        
        float x = cos(lat) * sin(lon - lon0);
        float y = cos(lat0) * sin(lat) - sin(lat0) * cos(lat) * cos(lon - lon0);
        
        return vec2(x, y);
    }
    """.trimIndent()

internal val ORTHOGRAPHIC_INVERT = """
    vec2 invert(vec2 origin, vec2 offset) {
        float x = offset.x;
        float y = offset.y;
                
        if (x == 0.0 && y == 0.0) {
            return vec2(degrees(origin.x), degrees(origin.y));
        }
                
        const float R = 1.0;
        float p = sqrt(x * x + y * y);
        float r = p / R;
        if (r < -1.0 || r > 1.0) return outsideProjection;
        
        float c = asin(r);
        float lat0 = origin.x;
        float lon0 = origin.y;
        
        float latitude = asin((cos(c) * sin(lat0)) + ((y * sin(c) * cos(lat0)) / p));
        float longitude = lon0 + atan(x * sin(c), (p * cos(lat0) * cos(c)) - (y * sin(lat0) * sin(c)));
        
        latitude = degrees(latitude) * -1.0;
        longitude = degrees(longitude);
        
        if (longitude > 180.0) {
            longitude = (-180.0) + (longitude - 180.0);
        } else if (longitude < -180.0) {
            longitude = 180.0 - abs(longitude + 180.0);
        }
        
        return vec2(latitude, longitude);
    }
    """.trimIndent()

internal val ORTHOGRAPHIC_PROJECTION = Projection(
    ORTHOGRAPHIC_PROJECT, ORTHOGRAPHIC_INVERT
)