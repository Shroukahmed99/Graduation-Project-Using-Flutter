import 'package:sehatak/Features/auth/data/model/login_model.dart';

abstract class SignUpState {}

class SignupInitial extends SignUpState {}

class SignupLoading extends SignUpState {}

class SignupSuccess extends SignUpState {
  final UsersModel uersModel;

  SignupSuccess(this.uersModel);
}

class SignupFailure extends SignUpState {
  final String errorMessage;

  SignupFailure(this.errorMessage);
}
