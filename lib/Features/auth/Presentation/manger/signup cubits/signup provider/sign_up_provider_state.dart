
import 'package:sehatak/Features/auth/data/model/login_model.dart';

abstract class SignUpProviderState {}

class SignUpProviderInitial extends SignUpProviderState {
}

class SignUpProviderLoading extends SignUpProviderState {
}

class SignUpProviderSuccess extends SignUpProviderState {
  final UsersModel usersModel;
  
  SignUpProviderSuccess(this.usersModel);
}

class SignUpProviderFailure extends SignUpProviderState {
  final String errorMessage;

  SignUpProviderFailure(this.errorMessage);
}
