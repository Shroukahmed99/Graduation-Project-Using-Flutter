import 'package:dio/dio.dart';
import 'package:sehatak/const.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<Map<String, dynamic>> post({required endPoint, required data}) async {
    var response = await dio.post(
      '$baseUrl$endPoint',
      data: data,
    );
    return response.data;
  }
}
