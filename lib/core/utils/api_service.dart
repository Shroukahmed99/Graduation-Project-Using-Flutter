import 'package:dio/dio.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/utils/cache_helper.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio) {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // ✅ تحميل التوكن وإضافته إلى كل الطلبات
        String? token = await CacheHelper.getData(key: 'token');
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }

        handler.next(options);
      },
      onResponse: (response, handler) {
        // ✅ استخراج التوكن من الكوكيز أو جسم الاستجابة
        String? token;
        String? cookies = response.headers['set-cookie']?.first;

        if (cookies != null) {
          try {
            token = cookies
                .split(';')
                .firstWhere(
                  (element) => element.contains('jwt'),
                  orElse: () => "",
                )
                .split('=')
                .last;
          } catch (e) {
            // معالجة الأخطاء بدون طباعة
          }
        }

        // ✅ التحقق من وجود التوكن في جسم الاستجابة
        if (token == null || token.isEmpty) {
          token = response.data['token'];
        }

        // ✅ حفظ التوكن إذا لم يكن فارغًا
        if (token != null && token.isNotEmpty) {
          CacheHelper.saveData(key: 'token', value: token);
        }

        handler.next(response);
      },
      onError: (DioException e, handler) {
        handler.next(e);
      },
    ));
  }

  Future<Map<String, dynamic>> post({required endpoint, required data}) async {
    Options options = Options(
      headers: {
        "Content-Type":
            (data is FormData) ? "multipart/form-data" : "application/json",
      },
    );
    var response =
        await dio.post("$baseUrl$endpoint", data: data, options: options);
    return response.data;
  }

  Future<Map<String, dynamic>> get({required endpoint, required data}) async {
    Options options = Options(
      headers: {
        "Content-Type":
            (data is FormData) ? "multipart/form-data" : "application/json",
      },
    );
    var response =
        await dio.post("$baseUrl$endpoint", data: data, options: options);
    return response.data;
  }

  Future<Map<String, dynamic>> patch({required endpoint, required data}) async {
    Options options = Options(
      headers: {
        "Content-Type":
            (data is FormData) ? "multipart/form-data" : "application/json",
      },
    );
    var response =
        await dio.patch("$baseUrl$endpoint", data: data, options: options);
    return response.data;
  }
}
