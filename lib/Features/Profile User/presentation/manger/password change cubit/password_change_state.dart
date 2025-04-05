// password_change_state.dart
import 'package:sehatak/Features/Profile%20User/data/models/password_change_response_model.dart';

abstract class PasswordChangeState {}

class PasswordChangeInitial extends PasswordChangeState {}

class PasswordChangeLoading extends PasswordChangeState {}

class PasswordChangeSuccess extends PasswordChangeState {
  final PasswordChangeResponseModel response;

  PasswordChangeSuccess(this.response);
}

class PasswordChangeFailure extends PasswordChangeState {
  final String errMessage;

  PasswordChangeFailure(this.errMessage);
}