
import 'package:sehatak/Features/auth/data/model/login_model.dart';

abstract class SignUpProviderState {}

class SignupInitial extends SignUpProviderState {
}

class SignupLoading extends SignUpProviderState {
}

class SignupSuccess extends SignUpProviderState {
  final UsersModel usersModel;
  
  SignupSuccess(this.usersModel);
}

class SignupFailure extends SignUpProviderState {
  final String errorMessage;

  SignupFailure(this.errorMessage);
}
