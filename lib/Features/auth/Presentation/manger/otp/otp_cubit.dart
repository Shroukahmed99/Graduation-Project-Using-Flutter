import 'package:bloc/bloc.dart';
import 'package:sehatak/Features/auth/Presentation/manger/otp/otp_state.dart';
import 'package:sehatak/Features/auth/data/repo/users_repo.dart';

class OtpCubit extends Cubit<OtpState> {
  final UsersRepo usersRepo;

  OtpCubit(this.usersRepo) : super(OtpInitial());

  Future<void> verifyOtp(String resetCode) async {
    emit(OtpLoading());
    final result = await usersRepo.otpUser(resetCode: resetCode);

    result.fold(
      (failure) => emit(OtpFailure(failure.errorMessage)),
      (otpModel) => emit(OtpSuccess(otpModel)),
    );
  }
}
