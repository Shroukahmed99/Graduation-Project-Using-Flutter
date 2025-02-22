import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final Dio _dio = Dio(); // كائن Dio للتعامل مع API

  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoading()); // تغيير الحالة إلى تحميل

    try {
      Response response = await _dio.post(
        'https://example.com/api/login', // رابط API
        data: {'email': email, 'password': password},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 200) {
        // إذا تمت المصادقة بنجاح
        String token = response.data['token']; // استخراج التوكن
        emit(LoginSuccess(token: token));
      } else {
        emit(LoginFailure(
            errMessage: 'Login failed: ${response.data['message']}'));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        emit(LoginFailure(errMessage: 'Error: ${e.response?.data['message']}'));
      } else {
        emit(LoginFailure(errMessage: 'Network error, please try again.'));
      }
    } catch (e) {
      emit(LoginFailure(errMessage: 'Unexpected error occurred.'));
    }
  }
}
