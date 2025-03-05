import 'package:dio/dio.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/utils/cache_helper.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio) {
    dio.interceptors.add(InterceptorsWrapper(
      onResponse: (response, handler) {
        print("Response Headers: ${response.headers}");

        // استخراج التوكن من الكوكيز
        String? cookies = response.headers['set-cookie']?.first;
        String? token;

        if (cookies != null) {
          try {
            token = cookies.split(';').firstWhere(
                  (element) => element.contains('jwt'),
                  orElse: () => "",
                );

            if (token.isNotEmpty) {
              token = token.split('=').last;
              print("✅ Token from Cookies: $token");
            }
          } catch (e) {
            print("⚠️ Error extracting token from cookies: $e");
          }
        }

        // استخراج التوكن من جسم الاستجابة إذا لم يكن في الكوكيز
        if (token == null || token.isEmpty) {
          if (response.data.containsKey('token')) {
            token = response.data['token'];
            print("✅ Token from Response Body: $token");
          }
        }

        // حفظ التوكن في الكاش إذا لم يكن فارغًا
        if (token != null && token.isNotEmpty) {
          CacheHelper.saveData(key: 'token', value: token);
        } else {
          print("⚠️ Warning: Attempted to save empty/null token");
        }

        handler.next(response);
      },
    ));
  }

  Future<Response> post(
      {required String endpoint, required Map<String, dynamic> data}) async {
    try {
      Response response = await dio.post(
        "$baseUrl$endpoint",
        data: data,
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );

      return response;
    } catch (e) {
      print("❌ API Error: $e");
      throw Exception("Failed to connect to API");
    }
  }

  Future<Response> get({required String endpoint}) async {
    try {
      Response response = await dio.get(
        "$baseUrl$endpoint",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );

      return response;
    } catch (e) {
      print("❌ API Error: $e");
      throw Exception("Failed to connect to API");
    }
  }
}
