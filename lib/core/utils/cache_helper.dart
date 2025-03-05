import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _sharedPreferences;

  /// تهيئة SharedPreferences عند بدء التطبيق
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  /// حفظ البيانات مع منع القيم الفارغة أو null
  static Future<void> saveData(
      {required String key, required dynamic value}) async {
    if (_sharedPreferences == null) {
      print("⚠️ SharedPreferences not initialized!");
      return;
    }

    if (value == null || value.toString().isEmpty) {
      print("⚠️ Warning: Attempt to save empty/null value for key: $key");
      return; // لا تحفظ القيم الفارغة
    }

    if (value is String) {
      await _sharedPreferences!.setString(key, value);
    } else if (value is int) {
      await _sharedPreferences!.setInt(key, value);
    } else if (value is bool) {
      await _sharedPreferences!.setBool(key, value);
    } else if (value is double) {
      await _sharedPreferences!.setDouble(key, value);
    } else {
      print("⚠️ Unsupported data type for key: $key");
      return;
    }

    print("✅ Saved to Cache: $key => $value");
  }

  /// استرجاع البيانات المحفوظة
  static String? getData({required String key}) {
    if (_sharedPreferences == null) {
      print("⚠️ SharedPreferences not initialized!");
      return null;
    }

    String? value = _sharedPreferences?.getString(key);
    print("🔍 Retrieved from Cache: $key => ${value ?? 'null'}");
    return value;
  }

  /// إزالة البيانات المحفوظة
  static Future<void> removeData({required String key}) async {
    if (_sharedPreferences == null) {
      print("⚠️ SharedPreferences not initialized!");
      return;
    }

    await _sharedPreferences!.remove(key);
    print("🗑️ Removed from Cache: $key");
  }
}
