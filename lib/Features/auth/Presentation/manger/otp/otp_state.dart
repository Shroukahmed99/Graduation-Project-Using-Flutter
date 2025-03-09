import 'package:sehatak/Features/auth/data/model/otp_model.dart';

abstract class OtpState {}

class OtpInitial extends OtpState {}

class OtpLoading extends OtpState {}

class OtpSuccess extends OtpState {
  final OtpModel otpModel;
  OtpSuccess(this.otpModel);
}

class OtpFailure extends OtpState {
  final String errorMessage;
  OtpFailure(this.errorMessage);
}
