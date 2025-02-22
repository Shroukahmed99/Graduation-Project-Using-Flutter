part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String token; // حفظ التوكن عند نجاح تسجيل الدخول
  LoginSuccess({required this.token});
}

class LoginFailure extends LoginState {
  final String errMessage;
  LoginFailure({required this.errMessage});
}
