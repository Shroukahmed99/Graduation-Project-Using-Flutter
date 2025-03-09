import 'package:sehatak/Features/auth/data/model/set_password.dart';

abstract class SetPasswordState {}

class SetPasswordInitial extends SetPasswordState {}

class SetPasswordLoading extends SetPasswordState {}

class SetPasswordSuccess extends SetPasswordState {
  final SetPassword setPassword;

  SetPasswordSuccess(this.setPassword);
}

class SetPasswordFailure extends SetPasswordState {
  final String errorMessage;
  SetPasswordFailure(this.errorMessage);
}
