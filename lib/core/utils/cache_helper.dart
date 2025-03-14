import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (_sharedPreferences == null) return false;

    try {
      if (value is Map<String, dynamic>) {
        return await _sharedPreferences!.setString(key, jsonEncode(value));
      } else if (value is String) {
        return await _sharedPreferences!.setString(key, value);
      } else if (value is int) {
        return await _sharedPreferences!.setInt(key, value);
      } else if (value is bool) {
        return await _sharedPreferences!.setBool(key, value);
      } else if (value is double) {
        return await _sharedPreferences!.setDouble(key, value);
      }
    } catch (e) {
      print("Error saving data for key: $key, Error: $e");
    }
    return false;
  }

  static dynamic getData({required String key}) {
    if (_sharedPreferences == null || !_sharedPreferences!.containsKey(key)) {
      return null;
    }

    Object? value = _sharedPreferences!.get(key);
    if (value is String && value.startsWith('{') && value.endsWith('}')) {
      try {
        return jsonDecode(value);
      } catch (_) {
        return value;
      }
    }
    return value;
  }

  static Future<void> removeData({required String key}) async {
    if (_sharedPreferences != null) {
      await _sharedPreferences!.remove(key);
      print("Removed from Cache: $key");
    }
  }
}
