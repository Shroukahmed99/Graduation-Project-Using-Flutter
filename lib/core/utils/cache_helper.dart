import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _sharedPreferences;

  // تهيئة SharedPreferences
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    print("✅ SharedPreferences initialized successfully");
  }

  // حفظ البيانات
  static Future<bool> saveData({required String key, required dynamic value}) async {
    if (_sharedPreferences == null) await init(); // ضمان التهيئة

    bool success = false;
    try {
      if (value is String) {
        success = await _sharedPreferences!.setString(key, value);
      } else if (value is int) {
        success = await _sharedPreferences!.setInt(key, value);
      } else if (value is bool) {
        success = await _sharedPreferences!.setBool(key, value);
      } else if (value is double) {
        success = await _sharedPreferences!.setDouble(key, value);
      } else if (value is Map<String, dynamic>) {
        success = await _sharedPreferences!.setString(key, jsonEncode(value));
      }

      if (success) {
        print("✅ Successfully saved - Key: $key");
      } else {
        print("❌ Failed to save data - Key: $key");
      }
    } catch (e) {
      print("❌ Error saving data for key: $key - Error: $e");
    }
    return success;
  }

  // استرجاع البيانات
  static dynamic getData({required String key}) {
    if (_sharedPreferences == null) {
      print("❌ SharedPreferences is not initialized!");
      return null;
    }

    if (!_sharedPreferences!.containsKey(key)) {
      print("⚠️ No data found for key: $key");
      return null;
    }

    Object? value = _sharedPreferences!.get(key);
    if (value == null || (value is String && value.isEmpty)) {
      print("⚠️ Empty value retrieved for key: $key");
      return null;
    }

    if (value is String && value.startsWith('{') && value.endsWith('}')) {
      try {
        return jsonDecode(value);
      } catch (_) {
        return value;
      }
    }

    print("🔍 Retrieved from Cache - Key: $key, Value: $value");
    return value;
  }

  // حذف البيانات
  static Future<void> removeData({required String key}) async {
    if (_sharedPreferences != null && _sharedPreferences!.containsKey(key)) {
      await _sharedPreferences!.remove(key);
      print("✅ Removed successfully - Key: $key");
    }
  }
}
