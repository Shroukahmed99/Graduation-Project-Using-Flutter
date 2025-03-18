import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/password_settings_view.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/profile_view.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/setting_profile_view.dart';
import 'package:sehatak/Features/Questions/presentation/views/Introduction_screen_service.dart';
import 'package:sehatak/Features/Questions/presentation/views/age_selection_provider_screen.dart';
import 'package:sehatak/Features/Questions/presentation/views/gender_selection_view_service.dart';
import 'package:sehatak/Features/Questions/presentation/views/insert_data_view.dart';
import 'package:sehatak/Features/Questions/presentation/views/jop_selection_view.dart';
import 'package:sehatak/Features/Questions/presentation/views/price_selection_view.dart';
import 'package:sehatak/Features/Questions/presentation/views/what_goal_views.dart';
import 'package:sehatak/Features/auth/Presentation/views/set_password_views.dart';
import 'package:sehatak/Features/auth/Presentation/views/login_view.dart';
import 'package:sehatak/Features/auth/Presentation/views/otp_view.dart';
import 'package:sehatak/Features/auth/Presentation/views/signup_view_client.dart';
import 'package:sehatak/Features/auth/Presentation/views/signup_view_service.dart';
import 'package:sehatak/Features/home/presentation/views/details_screen_view.dart';
import 'package:sehatak/Features/home/presentation/views/home_view.dart';
import 'package:sehatak/Features/home/presentation/views/nutrition_view.dart';
import 'package:sehatak/Features/home/presentation/views/physical_view.dart';
import 'package:sehatak/Features/home/presentation/views/workout_view.dart';
import 'package:sehatak/Features/success%20register/otp_success.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/set_password_view_body.dart';
import 'package:sehatak/Features/Questions/presentation/views/introduction_screen_client.dart';
import 'package:sehatak/Features/Questions/presentation/views/age_selection_views.dart';
import 'package:sehatak/Features/Questions/presentation/views/gender_selection_view_client.dart';
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
  static const kGenderSelectionViewClient = '/GenderSelectionViewClient';
  static const kIntroductionScreenService = '/IntroductionScreenService';
  static const kAgeSelectionScreen = '/AgeSelectionScreen';
  static const kWieghtViews = '/WieghtViews';
  static const kHieghtViews = '/HieghtViews';
  static const kRoleSelectionScreen = '/RoleSelectionScreen';
  static const kWhatGoalViews = '/WhatGoalViews';
  static const kPhysicalActivityView = '/PhysicalActivityView';
  static const kSignupViewClient = '/SignupViewClient';
  static const kSuccessViewClient = '/SuccessViewClient';
  static const kIntroductionScreenClient = '/IntroductionScreenClient';
  static const kOtpView = '/OtpView';
  static const kSetPasswordViewBody = '/SetPasswordViewBody';
  static const kOtpSuccess = '/OtpSuccess';
  static const kSetPasswordView = '/SetPasswordView';
  static const kSetPasswordSuccess = '/SetPasswordSuccess';
  static const kSignupViewService = '/SignupViewService';
  static const kJopSelectionView = '/JopSelectionView';
  static const kGenderSelectionViewService = '/GenderSelectionViewService';
  static const kInsertDataView = '/InsertDataView';
  static const kSuccessViewService = '/SuccessViewService';
  static const kPriceSelectionView = '/PriceSelectionView';
  static const kAgeSelectionProviderScreen = '/AgeSelectionProviderScreen';
  static const kWorkoutView = "/WorkoutView";
  static const kPhysicalView = "/PhysicalView";
  static const kSettingProfileView = "/SettingProfileView";
  static const kProfileView = '/ProfileView';
  static const kPasswordSettingsView = '/PasswordSettingsView';
  static const kNutritionView = "/NutritionView";
  static const kHomeView = '/HomeView';
  static const kDetailsScreenView = '/DetailsScreenView';

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
        path: kGenderSelectionViewClient,
        builder: (context, state) => const GenderSelectionViewClient(),
      ),
      GoRoute(
        path: kAgeSelectionScreen,
        builder: (context, state) => const AgeSelectionViews(),
      ),
      GoRoute(
        path: kAgeSelectionProviderScreen,
        builder: (context, state) => const AgeSelectionProviderScreen(),
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
        builder: (context, state) => const PhysicalActivityView(),
      ),
      GoRoute(
        path: kSignupViewClient,
        builder: (context, state) => const SignupViewClient(),
      ),
      GoRoute(
        path: kSuccessViewClient,
        builder: (context, state) => const SuccessViewClient(),
      ),
      GoRoute(
        path: kIntroductionScreenClient,
        builder: (context, state) => const IntroductionScreenClient(),
      ),
      GoRoute(
        path: kIntroductionScreenClient,
        builder: (context, state) => const IntroductionScreenService(),
      ),
      GoRoute(
        path: kOtpView,
        builder: (context, state) => const OtpView(),
      ),
      GoRoute(
        path: kSetPasswordViewBody,
        builder: (context, state) => SetPasswordViewBody(),
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
      GoRoute(
        path: kGenderSelectionViewService,
        builder: (context, state) => const GenderSelectionViewService(),
      ),
      GoRoute(
        path: kInsertDataView,
        builder: (context, state) => const InsertDataView(),
      ),
      GoRoute(
        path: kSuccessViewService,
        builder: (context, state) => const SuccessViewService(),
      ),
      GoRoute(
        path: kPriceSelectionView,
        builder: (context, state) => const PriceSelectionView(),
      ),
      GoRoute(
        path: kWorkoutView,
        builder: (context, state) => const WorkoutView(),
      ),
      GoRoute(
        path: kPhysicalView,
        builder: (context, state) => const PhysicalView(),
      ),
      GoRoute(
        path: kNutritionView,
        builder: (context, state) => const NutritionView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kSettingProfileView,
        builder: (context, state) => const SettingProfileView(),
      ),
      GoRoute(
        path: kProfileView,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: kPasswordSettingsView,
        builder: (context, state) => const PasswordSettingsView(),
      ),
      GoRoute(
        path: kDetailsScreenView,
        builder: (context, state) => const DetailsScreenView(),
      ),
    ],
  );
}
