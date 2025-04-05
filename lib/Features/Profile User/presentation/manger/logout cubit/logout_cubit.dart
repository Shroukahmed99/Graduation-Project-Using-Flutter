import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/Profile%20User/data/repo/profile_repository.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/logout%20cubit/logout_state.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/feedback_dialog.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/utils/cache_helper.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final ProfileRepository profileRepository;
  Timer? _countdownTimer;
  int _secondsRemaining = 5;
  final StreamController<int> _countdownController = StreamController<int>();

  LogoutCubit(this.profileRepository) : super(LogoutInitial());

  Future<void> logout(BuildContext context) async {
    emit(LogoutLoading());

    try {
      final response = await profileRepository.logout();

      response.fold(
        (failure) {
          emit(LogoutError('Error In Logout, Please Try Again'));
          FeedbackDialog.show(context, 'Error In Logout, Please Try Again', false, null);
        },
        (logoutResponse) async {
          await CacheHelper.removeData(key: 'token');
          _secondsRemaining = 5;
          _countdownController.add(_secondsRemaining);
          FeedbackDialog.show(context, "Logout successful,Redirecting in", true, _countdownController);
          _startCountdown(context);
        },
      );
    } catch (error) {
      emit(LogoutError(error.toString()));
      FeedbackDialog.show(context, 'Error: ${error.toString()}', false, null);
    }
  }

  void _startCountdown(BuildContext context) {
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 1) {
        _secondsRemaining--;
        _countdownController.add(_secondsRemaining);
      } else {
        _countdownTimer?.cancel();
        Navigator.of(context).pop();
        _navigateToLogin(context);
      }
    });
  }

  void _navigateToLogin(BuildContext context) {
    GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
  }

  @override
  Future<void> close() {
    _countdownTimer?.cancel();
    _countdownController.close();
    return super.close();
  }
}
