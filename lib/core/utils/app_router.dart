import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/Community/presentation/views/community_view.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/display_client_profile_details_view.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/display_provider_profile_details_view.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/feedback_view.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/widgets%20google%20fit/fitness_link_view.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/password_settings_view.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/profile_view.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/profile_provider_view.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/setting_profile_provider_view.dart';
import 'package:sehatak/Features/Profile%20User/presentation/views/setting_profile_view.dart';
import 'package:sehatak/Features/Questions/presentation/views/Introduction_screen_service.dart';
import 'package:sehatak/Features/Questions/presentation/views/age_selection_provider_screen.dart';
import 'package:sehatak/Features/Questions/presentation/views/gender_selection_view_service.dart';
import 'package:sehatak/Features/Questions/presentation/views/insert_data_view.dart';
import 'package:sehatak/Features/Questions/presentation/views/jop_selection_view.dart';
import 'package:sehatak/Features/Questions/presentation/views/price_selection_view.dart';
import 'package:sehatak/Features/Questions/presentation/views/what_goal_views.dart';
import 'package:sehatak/Features/articles/presentation/views/articles_view.dart';
import 'package:sehatak/Features/auth/Presentation/views/set_password_views.dart';
import 'package:sehatak/Features/auth/Presentation/views/login_view.dart';
import 'package:sehatak/Features/auth/Presentation/views/otp_view.dart';
import 'package:sehatak/Features/auth/Presentation/views/signup_view_client.dart';
import 'package:sehatak/Features/auth/Presentation/views/signup_view_service.dart';
import 'package:sehatak/Features/chat%20bot/presentation/views/chat_bot_intro_view.dart';
import 'package:sehatak/Features/chat%20bot/presentation/views/chatbot_view.dart';
import 'package:sehatak/Features/chat/data/repo/chat_repo_impl.dart';
import 'package:sehatak/Features/chat/presentation/views/chat_view_client.dart';
import 'package:sehatak/Features/chat/presentation/views/chat_view_service.dart';
import 'package:sehatak/Features/home%20service/data/models/custmer_model.dart';
import 'package:sehatak/Features/home%20service/data/models/custmer_new_model.dart';
import 'package:sehatak/Features/home%20service/presentation/views/widget/custom_custmers.dart';
import 'package:sehatak/Features/home%20service/presentation/views/widget/custom_new_custmers.dart';
import 'package:sehatak/Features/home/presentation/views/details_nutrition_view.dart';
import 'package:sehatak/Features/home/presentation/views/details_physical_view.dart';
import 'package:sehatak/Features/home/presentation/views/details_workout_view.dart';
import 'package:sehatak/Features/home/presentation/views/home_view_client.dart';
import 'package:sehatak/Features/home/presentation/views/nutrition_view.dart';
import 'package:sehatak/Features/home/presentation/views/physical_view.dart';
import 'package:sehatak/Features/home/presentation/views/widget/home%20widget/image_details_page.dart';
import 'package:sehatak/Features/payment/presentation/views/payment_view.dart';
import 'package:sehatak/Features/success%20register/success_view_service.dart';
import 'package:sehatak/Features/home%20service/presentation/views/home_provider_view.dart';
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
import 'package:sehatak/Features/success%20register/success_view_client.dart';
import 'package:sehatak/Features/on%20Boarding/Presentation/views/on_boarding_view.dart';
import 'package:sehatak/core/utils/api_service.dart';
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
  static const kSetProviderSuccess = '/SetProviderSuccess';
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
  static const kSettingProfileProviderView = "/SettingProfileProviderView";
  static const kProfileProviderView = '/ProfileProviderView';
  static const kDisplayProviderProfileDetailsView = '/DisplayProviderProfileDetailsView';
  static const kDisplayClientProfileDetailsView = '/DisplayClientProfileDetailsView';
  static const kPasswordSettingsView = '/PasswordSettingsView';
  static const kNutritionView = "/NutritionView";
  static const kHomeViewClient = '/HomeViewClient';
  static const kDetailsNutritionView = '/DetailsNutritionView/:id';
  static const kDetailsPhysicalView = '/DetailsPhysicalView/:id';

  static const kDetailsWorkoutView = '/DetailsWorkoutView:id';
  static const kHomeProviderView = '/HomeProviderView';
  static const kArticlesView = '/ArticlesView';
  static const kCommunityView = '/CommunityView';
  static const kCustomCustmers = '/CustomCustmers';
  static const kCustomNewCustmers = '/CustomNewCustmers';
  static const kPaymentView = '/PaymentView';

  static const kArticleDetailsPage = '/ArticleDetailsPage:id';
  static const kChatViewClient = '/ChatViewClient';
  static const kChatViewService = '/ChatViewService';
  static const kChatBotView = '/ChatBotView';
   static const kChatBotIntroView = '/ChatBotIntroView';
   static const kFeedbackView= "/FeedbackView";
   static const kFitnessLinkView= "/FitnessLinkView";
static const kGoogleFitHandlerPage= "/GoogleFitHandlerPage";
   


  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const FirstSplashScreen();
      },
    ),
    


//  GoRoute(
//       path: '/fitness-auth',
//       builder: (context, state) {
//         final url = state.extra as String;
//         return FitnessWebViewPage(url: url);
//       },
//     ),
//     GoRoute(
//       path: '/fitness-data',
//       builder: (context, state) => const FitnessLinkBody(),
//     ),

// GoRoute(
//   path: '/fitness-handler',
//   builder: (context, state) => const GoogleFitHandlerView(),
// ),







GoRoute(
      path: kFitnessLinkView,
      builder: (context, state) => const FitnessLinkView(),
    ),

     GoRoute(
      path: kChatBotIntroView,
      builder: (context, state) => const ChatBotIntroView(),
    ),
    GoRoute(
      path: kChatBotView,
      builder: (context, state) => const ChatBotView(),
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
      path: kSuccessViewService,
      builder: (context, state) => const SuccessViewService(),
    ),
    GoRoute(
      path: kIntroductionScreenClient,
      builder: (context, state) => const IntroductionScreenClient(),
    ),
    GoRoute(
      path: kIntroductionScreenService,
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
      path: kHomeViewClient,
      builder: (context, state) => const HomeViewClient(),
    ),
    GoRoute(
      path: kSettingProfileView,
      builder: (context, state) => const SettingProfileView(),
    ),
    GoRoute(
      path: kProfileProviderView,
      builder: (context, state) => const ProfileProviderView(),
    ),
    GoRoute(
      path: kSettingProfileProviderView,
      builder: (context, state) => const SettingProfileProviderView(),
    ),
    GoRoute(
      path: kProfileView,
      builder: (context, state) => const ProfileView(),
    ),
 GoRoute(
      path: kFeedbackView,
      builder: (context, state) => const FeedbackView(),
    ),



    GoRoute(
      path: kDisplayProviderProfileDetailsView,
      builder: (context, state) => const DisplayProviderProfileDetailsView(),
    ), 

 GoRoute(
      path: kDisplayClientProfileDetailsView,
      builder: (context, state) => const DisplayClientProfileDetailsView(),
    ),  

    GoRoute(
      path: kPasswordSettingsView,
      builder: (context, state) => const PasswordSettingsView(),
    ),
    GoRoute(
      path: '/nutrition/:id',
      builder: (context, state) {
        final nutritionId = state.pathParameters['id'] ?? '';
        return DetailsNutritionView(id: nutritionId);
      },
    ),
    GoRoute(
      path: '/coaches/:id',
      builder: (context, state) {
        final coachesId = state.pathParameters['id'] ?? '';
        return DetailsWorkoutView(id: coachesId);
      },
    ),
    GoRoute(
      path: '/physical/:id',
      builder: (context, state) {
        final physicalId = state.pathParameters['id'] ?? '';
        return DetailsPhysicalView(id: physicalId);
      },
    ),
    GoRoute(
      path: kHomeProviderView,
      builder: (context, state) => const HomeProviderView(),
    ),
    GoRoute(
      path: kArticlesView,
      builder: (context, state) => const ArticlesView(),
    ),
    GoRoute(
      path: kCommunityView,
      builder: (context, state) => const CommunityView(),
    ),
    GoRoute(
      path: kCustomCustmers,
      builder: (context, state) {
        final paymentData = state.extra as PaymentData;
        return CustomCustmers(data: paymentData);
      },
    ),
    GoRoute(
      path: kCustomNewCustmers,
      builder: (context, state) {
        final clientData = state.extra as ClientData;
        return CustomNewCustmers(data: clientData);
      },
    ),
    GoRoute(
      path: kPaymentView,
      builder: (context, state) {
        final extraData = state.extra as Map<String, dynamic>;
        final priceRange = extraData['priceRange'];
        final id = extraData['id'];

        return PaymentView(
          priceFromApi: priceRange,
          id: id,
        );
      },
    ),
    GoRoute(
        path: '/article/:id',
        builder: (context, state) {
          final articleId = state.pathParameters['id'] ?? '';
          return ArticleDetailsPage(
            id: articleId,
          );
        }),
    GoRoute(
      path: kChatViewClient,
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;

        final id = extra['id'];
        final senderId = extra['senderId'];
        final receiverId = extra['receiverId'];

        final chatRepo = ChatRepoImpl(ApiService(Dio()));

        return ChatViewClient(
          bookingId: id,
          chatRepo: chatRepo,
          senderId: senderId,
          receiverId: receiverId,
        );
      },
    ),
    GoRoute(
      path: kChatViewService,
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        final id = extra['id'];
        final senderId = extra['senderId'];

        final receiverId = extra['receiverId'];

        final chatRepo = ChatRepoImpl(ApiService(Dio()));

        return ChatViewService(
          bookingId: id,
          chatRepo: chatRepo,
          senderId: senderId,
          receiverId: receiverId,
        );
      },
    ),
  ]);
}
