import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/Questions/presentation/views/jop_selection_view.dart';
import 'package:sehatak/Features/Questions/presentation/views/what_goal_views.dart';
import 'package:sehatak/Features/auth/Presentation/views/forget_password_views.dart';
import 'package:sehatak/Features/auth/Presentation/views/login_view.dart';
import 'package:sehatak/Features/auth/Presentation/views/otp_view.dart';
import 'package:sehatak/Features/auth/Presentation/views/signup_view_client.dart';
import 'package:sehatak/Features/auth/Presentation/views/signup_view_service.dart';
import 'package:sehatak/Features/success%20register/otp_success.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/set_password_view_body.dart';
import 'package:sehatak/Features/Questions/presentation/views/introduction_screen.dart';
import 'package:sehatak/Features/Questions/presentation/views/age_selection_views.dart';
import 'package:sehatak/Features/Questions/presentation/views/gender_selection_views.dart';
import 'package:sehatak/Features/Questions/presentation/views/height_views.dart';
import 'package:sehatak/Features/Questions/presentation/views/role_selection_views.dart';
import 'package:sehatak/Features/Questions/presentation/views/physical_activity_view.dart';
import 'package:sehatak/Features/Questions/presentation/views/weight_views.dart';
import 'package:sehatak/Features/Splash/Presentation/views/first_splash_screen.dart';
import 'package:sehatak/Features/Splash/Presentation/views/second_splash_screen.dart';
import 'package:sehatak/Features/success%20register/set_password_success.dart';
import 'package:sehatak/Features/success%20register/success_view.dart';
import 'package:sehatak/Features/on%20Boarding/Presentation/views/on_boarding_view.dart';

abstract class AppRouter {
  static const kSecondSplashScreen = "/SecondSplashScreen";
  static const kOnBoardingView = '/OnBoardingView';
  static const kLoginView = '/LoginView';
  static const kGenderSelectionScreen = '/GenderSelectionScreen';
  static const kAgeSelectionScreen = '/AgeSelectionScreen';
  static const kWieghtViews = '/WieghtViews';
  static const kHieghtViews = '/HieghtViews';
  static const kRoleSelectionScreen = '/RoleSelectionScreen';
  static const kWhatGoalViews = '/WhatGoalViews';
  static const kPhysicalActivityView = '/PhysicalActivityView';
  static const kSignupViewClient = '/SignupViewClient';
  static const kSuccessView = '/SuccessView';
  static const kIntroductionScreen = '/IntroductionScreen';
  static const kOtpView = '/OtpView';
  static const kSetPasswordViewBody = '/SetPasswordViewBody';
  static const kOtpSuccess = '/OtpSuccess';
  static const kSetPasswordView = '/SetPasswordView';
  static const kSetPasswordSuccess = '/SetPasswordSuccess';
  static const kSignupViewService = '/SignupViewService';
  static const kJopSelectionView = '/JopSelectionView';

  // static const kLoginView = '/LoginView';

  // static const kLoginView = '/LoginView';

  // static const kLoginView = '/LoginView';

  // static const kLoginView = '/LoginView';

  // static const kLoginView = '/LoginView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const FirstSplashScreen(),
      ),
      GoRoute(
        path: kSecondSplashScreen,
        builder: (context, state) => const SecondSplashScreen(),
      ),
      GoRoute(
        path: kOnBoardingView,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kGenderSelectionScreen,
        builder: (context, state) => const GenderSelectionView(),
      ),
      GoRoute(
        path: kAgeSelectionScreen,
        builder: (context, state) => const AgeSelectionViews(),
      ),
      GoRoute(
        path: kWieghtViews,
        builder: (context, state) => const WeightViews(),
      ),
      GoRoute(
        path: kHieghtViews,
        builder: (context, state) => const HeightViews(),
      ),
      GoRoute(
        path: kRoleSelectionScreen,
        builder: (context, state) => const RoleSelectionViews(),
      ),
      GoRoute(
        path: kWhatGoalViews,
        builder: (context, state) => const WhatGoalViews(),
      ),
      GoRoute(
        path: kPhysicalActivityView,
        builder: (context, state) => PhysicalActivityView(),
      ),
      GoRoute(
        path: kSignupViewClient,
        builder: (context, state) => const SignupViewClient(),
      ),
      GoRoute(
        path: kSuccessView,
        builder: (context, state) => const SuccessView(),
      ),
      GoRoute(
        path: kIntroductionScreen,
        builder: (context, state) => const IntroductionScreen(),
      ),
      GoRoute(
        path: kOtpView,
        builder: (context, state) => const OtpView(),
      ),
      GoRoute(
        path: kSetPasswordViewBody,
        builder: (context, state) => const SetPasswordViewBody(),
      ),
      GoRoute(
        path: kOtpSuccess,
        builder: (context, state) => const OtpSuccess(),
      ),
      GoRoute(
        path: kSetPasswordView,
        builder: (context, state) => const SetPasswordView(),
      ),
      GoRoute(
        path: kSetPasswordSuccess,
        builder: (context, state) => const SetPasswordSuccess(),
      ),
      GoRoute(
        path: kSignupViewService,
        builder: (context, state) => const SignupViewService(),
      ),
      GoRoute(
        path: kJopSelectionView,
        builder: (context, state) => const JopSelectionView(),
      ),
    ],
  );
}
