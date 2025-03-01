import 'package:dio/dio.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/utils/cache_helper.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio) {
    dio.interceptors.add(InterceptorsWrapper(
      onResponse: (response, handler) {
        String? cookies = response.headers['set-cookie']?.first; 
        if (cookies != null) {
          String? token = cookies.split(';').firstWhere(
            (element) => element.contains('jwt'),
            orElse: () => "",
          );
          if (token.isNotEmpty) {
            token = token.split('=').last;
            print("Token from Cookies: \$token");
            CacheHelper.saveData(key: 'token', value: token); 
          }
        }
        handler.next(response);
      },
    ));
  }

  Future<Response> post({required String endpoint, required Map<String, dynamic> data}) async {
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
      print("API Error: \$e");
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
      print("API Error: \$e");
      throw Exception("Failed to connect to API");
    }
  }
}