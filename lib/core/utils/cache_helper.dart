import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> saveData({required String key, required dynamic value}) async {
  await _sharedPreferences?.setString(key, value);
  print("$key => $value");
}


  static String? getData({required String key}) {
    return _sharedPreferences?.getString(key);
  }

  static Future<void> removeData({required String key}) async {
    await _sharedPreferences?.remove(key);
  }
  
}
