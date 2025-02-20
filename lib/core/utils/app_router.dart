import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/Auth/Presentation/Pages/Login/login_view.dart';
import 'package:sehatak/Features/Questions/Age%20Selection/pages/age_selection_screen.dart';
import 'package:sehatak/Features/Questions/Gender%20Selection/pages/gender_selection_screen.dart';
import 'package:sehatak/Features/Questions/weight%20selection/presentation/views/weight_views.dart';
import 'package:sehatak/Features/Splash/Presentation/widgets/first_splash_screen.dart';
import 'package:sehatak/Features/Splash/Presentation/widgets/second_splash_screen.dart';
import 'package:sehatak/Features/on%20Boarding/Presentation/on_boarding_view.dart';

abstract class AppRouter {
  static const kSecondSplashScreen = "/SecondSplashScreen";
  static const kOnBoardingView = '/OnBoardingView';
  static const kLoginView = '/LoginView';
  static const kGenderSelectionScreen = '/GenderSelectionScreen';
  static const kAgeSelectionScreen = '/AgeSelectionScreen';
  static const kWieghtViews = '/ WieghtViews';

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
        builder: (context, state) => const GenderSelectionScreen(),
      ),
      GoRoute(
        path: kAgeSelectionScreen,
        builder: (context, state) => const AgeSelectionScreen(),
      ),
      GoRoute(
        path: kWieghtViews,
        builder: (context, state) => const WieghtViews(),
      ),
    ],
  );
}
