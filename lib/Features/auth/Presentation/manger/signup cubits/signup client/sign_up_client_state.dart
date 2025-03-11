// sign_up_client_state.dart

import 'package:sehatak/Features/auth/data/model/login_model.dart';

abstract class SignUpState {}

class SignupInitial extends SignUpState {
  // الحالة الابتدائية (عند بداية عملية التسجيل)
}

class SignupLoading extends SignUpState {
  // حالة التحميل أثناء تنفيذ عملية التسجيل
}

class SignupSuccess extends SignUpState {
  final UsersModel usersModel;
  
  SignupSuccess(this.usersModel);
  // حالة النجاح عند إتمام عملية التسجيل
}

class SignupFailure extends SignUpState {
  final String errorMessage;

  SignupFailure(this.errorMessage);
  // حالة الفشل إذا حدث خطأ أثناء التسجيل
}
