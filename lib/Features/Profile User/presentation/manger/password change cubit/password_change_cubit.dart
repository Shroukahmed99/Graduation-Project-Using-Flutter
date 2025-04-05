// password_change_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Profile%20User/data/repo/profile_repository.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/password%20change%20cubit/password_change_state.dart';

class PasswordChangeCubit extends Cubit<PasswordChangeState> {
  final ProfileRepository profileRepository;

  PasswordChangeCubit(this.profileRepository) : super(PasswordChangeInitial());

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required String passwordConfirm,
  }) async {
    emit(PasswordChangeLoading());
    
    final result = await profileRepository.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
      passwordConfirm: passwordConfirm,
    );
    
    result.fold(
      (failure) => emit(PasswordChangeFailure(failure.errorMessage)),
      (response) => emit(PasswordChangeSuccess(response)),
    );
  }
}
