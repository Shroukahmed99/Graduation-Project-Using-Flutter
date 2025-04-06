import 'package:dio/dio.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/utils/cache_helper.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio) {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        if (!_isAuthRequest(options.path)) {
          String? token = await CacheHelper.getData(key: 'token');
          print("📌 Token before request: $token");

          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
        }
        handler.next(options);
      },
      onResponse: (response, handler) async {
        try {
          await _extractTokenFromCookies(response);
        } catch (e) {
          print("❌ Error extracting token: $e");
        }
        handler.next(response);
      },
      onError: (DioException e, handler) {
        handler.next(e);
      },
    ));
  }

  Future<Map<String, dynamic>> post(
      {required String endpoint, required dynamic data}) async {
    Options options = await _getOptions();
    var response =
        await dio.post("$baseUrl$endpoint", data: data, options: options);
    await _extractTokenFromCookies(response);
    return response.data;
  }

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await dio.get(
      "$baseUrl$endpoint",
    );
    return response.data;
  }

  Future<Map<String, dynamic>> patch(
      {required String endpoint, required dynamic data}) async {
    Options options = await _getOptions();
    var response =
        await dio.patch("$baseUrl$endpoint", data: data, options: options);
    return response.data;
  }

  Future<dynamic> delete({required String endpoint}) async {
    String? token = await CacheHelper.getData(key: 'token');
    print("xxxxxxxxxxxxxxxxxxx:$token");
    if (token == null || token.isEmpty) {
      throw Exception("Token is missing, please login again.");
    }

    try {
      var response = await dio.delete("$baseUrl$endpoint",
          options: Options(
            headers: {
              "Authorization": "Bearer $token",
            },
          ));

      print("🚀 API Response Data: ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 204) {
        if (response.data == null || response.data == "") {
          return 1;
        }
        return response.data;
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: "Unexpected status code: ${response.statusCode}",
        );
      }
    } catch (e) {
      print("🚨 Error in delete request: $e");
      rethrow;
    }
  }

  Future<Options> _getOptions() async {
    String? token = await CacheHelper.getData(key: 'token');
    return Options(
      headers: {
        "Content-Type": "application/json",
        if (token != null && token.isNotEmpty) "Authorization": "Bearer $token",
      },
    );
  }

  String? _extractTokenFromCookies(Response response) {
    List<String>? cookies = response.headers.map['set-cookie'];
    String? token;

    if (cookies != null) {
      for (var cookie in cookies) {
        if (cookie.startsWith("jwt=")) {
          token = cookie.split(";").first.split("=").last;
          CacheHelper.saveData(key: 'token', value: token);
          break;
        }
      }
    }

    print(token != null && token.isNotEmpty
        ? "✅ Extracted Token: $token"
        : "❌ No token found in Set-Cookie.");
    return token;
  }

  // This is the method that was missing
  bool _isAuthRequest(String path) {
    return path.contains("login") || path.contains("register");
  }
}
