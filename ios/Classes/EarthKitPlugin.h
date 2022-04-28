// float project_x(float *latPtr, float *lonPtr, int size);
// float project_y(float *latPtr, float *lonPtr, int size);

float *project(float size, float latitude0, float longitude0, float latitude, float longitude);
float *project_all(float size, int len, float latitude0, float longitude0, float *latitude, float *longitude);

float radians(float degrees);
