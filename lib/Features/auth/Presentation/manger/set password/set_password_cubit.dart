import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:sehatak/Features/auth/Presentation/manger/set%20password/set_password_state.dart';
import 'package:sehatak/Features/auth/data/model/set_password.dart';
import 'package:sehatak/Features/auth/data/repo/users_repo.dart';
import 'package:sehatak/core/error/failure.dart';

class SetPasswordCubit extends Cubit<SetPasswordState> {
  final UsersRepo usersRepo;

  SetPasswordCubit({required this.usersRepo}) : super(SetPasswordInitial());

  Future<void> setPassword(
      {required String password, required String confirmPassword}) async {
    emit(SetPasswordLoading());

    Either<Failure, SetPassword> response = await usersRepo.setPassword(
      password: password,
      passwordConfirm: confirmPassword,
    );

    response.fold(
      (failure) {
        print("❌ SetPassword API Error: ${failure.errorMessage}");
        emit(SetPasswordFailure(failure.errorMessage));
      },
      (setPasswordModel) {
        print("✅ SetPassword Success!");
        emit(SetPasswordSuccess(setPasswordModel));
      },
    );
  }
}
