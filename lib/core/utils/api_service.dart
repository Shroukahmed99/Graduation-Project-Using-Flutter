import 'package:dio/dio.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/utils/cache_helper.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio) {
    dio.interceptors.add(InterceptorsWrapper(
      onResponse: (response, handler) {
        try {
          // ✅ استخراج جميع الـ Cookies من الاستجابة وتخزينها
          List<String>? cookies = response.headers['set-cookie'];
          if (cookies != null && cookies.isNotEmpty) {
            String allCookies =
                cookies.join('; '); // دمج جميع الكوكيز في String واحد
            print("✅ Cookies from Response: $allCookies");
            CacheHelper.saveData(key: 'cookies', value: allCookies);
          }
        } catch (e) {
          print("⚠️ Cookie Extraction Error: $e");
        }
        handler.next(response);
      },
    ));
  }

  Future<Response> post({
    required String endpoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      // ✅ استرجاع الكوكيز المخزنة
      String? cookies = CacheHelper.getData(key: 'cookies');

      Response response = await dio.post(
        "$baseUrl$endpoint",
        data: data, // ✅ إرسال البيانات فقط بدون الكوكيز في Body
        options: Options(
          headers: {
            "Content-Type": "application/json",
            if (cookies != null && cookies.isNotEmpty)
              "Cookie": cookies, // ✅ إرسال الكوكيز في الهيدر
          },
          validateStatus: (status) =>
              status != null, // ✅ السماح لكل الرموز HTTP بالمرور
        ),
      );

      // ✅ طباعة الاستجابة
      print("📤 API Response [${response.statusCode}]: ${response.data}");

      return response;
    } on DioException catch (e) {
      // ✅ طباعة الخطأ مع التفاصيل
      print(
          "❌ API Error [${e.response?.statusCode}]: ${e.response?.data ?? e.message}");
      throw Exception("Failed to connect to API");
    }
  }

  Future<Response> get({required String endpoint}) async {
    try {
      // ✅ استرجاع الكوكيز المخزنة
      String? cookies = CacheHelper.getData(key: 'cookies');

      Response response = await dio.get(
        "$baseUrl$endpoint",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            if (cookies != null && cookies.isNotEmpty)
              "Cookie": cookies, // ✅ إرسال الكوكيز في الهيدر
          },
          validateStatus: (status) =>
              status != null, // ✅ السماح لكل الرموز HTTP بالمرور
        ),
      );

      // ✅ طباعة الاستجابة
      print("📤 API Response [${response.statusCode}]: ${response.data}");

      return response;
    } on DioException catch (e) {
      // ✅ طباعة الخطأ مع التفاصيل
      print(
          "❌ API Error [${e.response?.statusCode}]: ${e.response?.data ?? e.message}");
      throw Exception("Failed to connect to API");
    }
  }
}
