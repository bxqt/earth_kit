package de.bendix.earth_kit.util

import com.google.gson.Gson
import com.google.gson.reflect.TypeToken
import org.json.JSONObject

inline fun <reified T> String.toObject(): T {
    val gson = Gson()
    val type = object : TypeToken<T>() {}.type
    return gson.fromJson(this, type)
}

inline fun <reified T> HashMap<*, *>.toObject(): T {
    return JSONObject(this).toObject()
}

inline fun <reified T> JSONObject.toObject(): T {
    return toString().toObject()
}

inline fun <reified T> T.toGson(): String {
    val gson = Gson()
    val type = object : TypeToken<T>() {}.type
    return gson.toJson(this, type)
}