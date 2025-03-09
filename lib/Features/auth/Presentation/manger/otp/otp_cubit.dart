import 'package:bloc/bloc.dart';
import 'package:sehatak/Features/auth/Presentation/manger/otp/otp_state.dart';
import 'package:sehatak/Features/auth/data/repo/users_repo.dart';

class OtpCubit extends Cubit<OtpState> {
  final UsersRepo usersRepo;
  String otpCode = ""; // ✅ إضافة متغير لتخزين الكود

  OtpCubit(this.usersRepo) : super(OtpInitial());

  void updateOtpCode(String code) {
    otpCode = code;
  }

  Future<void> verifyOtp() async {
    if (otpCode.length != 5) {
      emit(OtpFailure("Please enter a valid OTP"));
      return;
    }

    emit(OtpLoading());
    final result = await usersRepo.otpUser(resetCode: otpCode);

    result.fold(
      (failure) => emit(OtpFailure(failure.errorMessage)),
      (otpModel) => emit(OtpSuccess(otpModel)),
    );
  }
}
