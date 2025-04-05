import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/Profile%20User/data/repo/profile_repository.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/delete%20cubit/delete_account_state.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/utils/cache_helper.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/Widgets/feedback_dialog.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  final ProfileRepository profileRepository;
  Timer? _countdownTimer;
  int _secondsRemaining = 10;
  final StreamController<int> _countdownController = StreamController<int>();

  DeleteAccountCubit(this.profileRepository) : super(DeleteAccountInitial());

  Future<void> deleteAccount(BuildContext context) async {
    emit(DeleteAccountLoading());

    try {
      final response = await profileRepository.deleteAccount();

      response.fold(
        (failure) {
          print("DeleteAccountError Failure: ${failure.errorMessage}");
          print("xxxxxxxxxxxxxxxxxxxxxxxxxxx");
          print("false");
          emit(DeleteAccountError(
              'Error in deleting account, please try again.'));
          FeedbackDialog.show(context,
              'Error in deleting account, please try again.', false, null);
        },
        (success) async {
          print("Delete account successful: $success");
          
          // في حالة النجاح، نقوم بإزالة التوكن من التخزين المؤقت
          await CacheHelper.removeData(key: 'token');
          
         
          
          // إعداد العد التنازلي
          _secondsRemaining = 10;
          _countdownController.add(_secondsRemaining);
          
          // إظهار رسالة النجاح مع العد التنازلي
          emit(DeleteAccountSuccess());
          FeedbackDialog.show(
              context, 
              "The account will be deleted in", 
              true, 
              _countdownController);
          
          // بدء العد التنازلي
          _startCountdown(context);
        },
      );
    } catch (error) {
      print("Unexpected error: $error");
      emit(DeleteAccountError(error.toString()));
      FeedbackDialog.show(context, 'Error: ${error.toString()}', false, null);
    }
  }

  void _startCountdown(BuildContext context) {
    // إلغاء أي مؤقت سابق
    _countdownTimer?.cancel();
    
    // إنشاء مؤقت جديد
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 1) {
        _secondsRemaining--;
        _countdownController.add(_secondsRemaining);
        print("Countdown: $_secondsRemaining");
      } else {
        // عند انتهاء العد التنازلي
        _countdownTimer?.cancel();
        // إغلاق نافذة الحوار
        Navigator.of(context).pop();
        // الانتقال إلى صفحة تسجيل الدخول
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