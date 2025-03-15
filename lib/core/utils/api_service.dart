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

        print("📤 Sending request to: ${options.uri}");
        print("📦 Headers: ${options.headers}");

        handler.next(options);
      },
      onResponse: (response, handler) {
        print("✅ Response Received from: ${response.requestOptions.uri}");
        print("📦 Response Data: ${response.data}");

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
            print("⚠️ Error extracting token from cookies: $e");
          }
        }

        // ✅ التحقق من وجود التوكن في جسم الاستجابة
        if (token == null || token.isEmpty) {
          token = response.data['token'];
        }

        // ✅ حفظ التوكن إذا لم يكن فارغًا
        if (token != null && token.isNotEmpty) {
          CacheHelper.saveData(key: 'token', value: token);
          print("🔐 Token saved: $token");
        }

        handler.next(response);
      },
      onError: (DioException e, handler) {
        print("❌ API Error: ${e.message}");
        print("📡 Request: ${e.requestOptions.uri}");

        // ✅ طباعة تفاصيل الخطأ لمساعدتك في التصحيح
        if (e.response != null) {
          print("🛑 Error Response Data: ${e.response?.data}");
          print("🔴 Status Code: ${e.response?.statusCode}");
        }

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

  Future<Response> get({required String endpoint}) async {
    try {
      Response response = await dio.get(
        "$baseUrl$endpoint",
        options: Options(headers: {"Content-Type": "application/json"}),
      );
      return response;
    } catch (e) {
      throw Exception("🚨 API Error: $e");
    }
  }

  Future<Map<String, dynamic>> patch({
    required String endpoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      // إرسال الطلب باستخدام dio
      Response response = await dio.patch(
        "$baseUrl$endpoint",
        data: data,
        options: Options(headers: {"Content-Type": "application/json"}),
      );

      // إرجاع البيانات المستلمة من الاستجابة
      return response.data;
    } catch (e) {
      // في حال حدوث خطأ، إلقاء استثناء
      throw Exception("🚨 API Error: $e");
    }
  }
}
