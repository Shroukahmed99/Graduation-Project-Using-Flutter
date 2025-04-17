import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehatak/Features/articles/data/repo/article_repo_impl.dart';
import 'package:sehatak/Features/articles/presentation/manger/getArticleById/get_article_by_id_cubit.dart';
import 'package:sehatak/Features/home/presentation/manger/navigation/navigation_cubit.dart';
import 'package:sehatak/core/utils/api_service.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/utils/cache_helper.dart';
import 'package:sehatak/const.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const HealthMateApp());
}

class HealthMateApp extends StatelessWidget {
  const HealthMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => NavigationCubit()),
        ],
        child: MaterialApp.router(
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'League Spartan',
            scaffoldBackgroundColor: backgroundColor,
          ),
        ),
      ),
    );
  }
}
