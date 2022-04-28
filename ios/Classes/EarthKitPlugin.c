#include <math.h>

#include "EarthKitPlugin.h"

#define M_PI 3.14159265358f

float *project(float size, float latitude0, float longitude0, float latitude, float longitude)
{
    float R = size / 2.0f;

    float lat0 = radians(latitude0);
    float lon0 = radians(longitude0);
    float lat = radians(latitude);
    float lon = radians(longitude);

    float *result = malloc(2 * sizeof(float));

    float x = R * cos(lat) * sin(lon - lon0);
    float y = R * (cos(lat0) * sin(lat) - sin(lat0) * cos(lat) * cos(lon - lon0));

    result[0] = x;
    result[1] = y;

    return result;
}

float *project_all(float size, int len, float latitude0, float longitude0, float *latitudes, float *longitudes)
{
    float R = size / 2.0f;

    float lat0 = radians(latitude0);
    float lon0 = radians(longitude0);

    float *result = malloc(2 * len * sizeof(float));

    for (int i = 0; i < len; i++)
    {
        float lat = radians(*latitudes);
        float lon = radians(*longitudes);

        float x = R * cos(lat) * sin(lon - lon0);
        float y = R * (cos(lat0) * sin(lat) - sin(lat0) * cos(lat) * cos(lon - lon0));

        int idx = i * 2;

        result[idx] = R + x;
        result[idx + 1] = size - (R + y);

        // latitudes++;
        // longitudes++;
    }

    return result;
}

float radians(float degrees)
{
    return degrees * (M_PI / 180.0f);
}