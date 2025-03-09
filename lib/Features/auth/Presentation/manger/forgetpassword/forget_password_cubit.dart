import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:sehatak/Features/auth/Presentation/manger/forgetpassword/forget_password_state.dart';
import 'package:sehatak/Features/auth/data/model/forget_password_model.dart';
import 'package:sehatak/Features/auth/data/repo/users_repo.dart';
import 'package:sehatak/core/error/failure.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final UsersRepo usersRepo;

  ForgetPasswordCubit(this.usersRepo) : super(ForgetPasswordInitial());

  Future<void> sendResetPasswordEmail(String email) async {
    emit(ForgetPasswordLoading());

    final Either<Failure, ForgetPasswordModel> response =
        await usersRepo.forgetUser(email: email);

    response.fold(
      (failure) => emit(ForgetPasswordFailure(failure.errorMessage)),
      (success) => emit(ForgetPasswordSuccess(success.message)),
    );
  }
}
