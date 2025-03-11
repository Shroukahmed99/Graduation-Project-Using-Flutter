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
  if (_sharedPreferences == null) {
    return false;  
  }

  bool isSaved = false;

  try {
    if (value is Map<String, dynamic>) {
      isSaved = await _sharedPreferences!.setString(key, jsonEncode(value));
    } else if (value is String) {
      isSaved = await _sharedPreferences!.setString(key, value);
    } else if (value is int) {
      isSaved = await _sharedPreferences!.setInt(key, value);
    } else if (value is bool) {
      isSaved = await _sharedPreferences!.setBool(key, value);
    } else if (value is double) {
      isSaved = await _sharedPreferences!.setDouble(key, value);
    } else {
      return false; 
    }
    return isSaved; 
  } catch (e) {
    print(" Error saving data for key: $key, Error: $e");
    return false;
  }
}

static dynamic getData({required String key}) {
  if (_sharedPreferences == null) {
    return null;
  }

  if (!_sharedPreferences!.containsKey(key)) {
    return null;
  }

  Object? value = _sharedPreferences!.get(key);

  if (value is String) {
    try {
      final decodedData = jsonDecode(value);
      return decodedData; 
    } catch (e) {
      return value; 
    }
  }

  return value; 
}

  static Future<void> removeData({required String key}) async {
    if (_sharedPreferences == null) {
      return;
    }

    await _sharedPreferences!.remove(key);
    print(" Removed from Cache: $key");
  }
}
