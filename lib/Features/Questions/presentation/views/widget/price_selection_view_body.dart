import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/Questions/presentation/manger/weight%20cubit/weight_cubit.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/custom_question_and_aswer.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/custom_slider_widget.dart';
import 'package:sehatak/Features/auth/Presentation/manger/signup%20cubits/signup%20provider/sign_up_provider_cubit.dart';
import 'package:sehatak/Features/auth/Presentation/manger/signup%20cubits/signup%20provider/sign_up_provider_state.dart';
import 'package:sehatak/core/function/custom_snacbar.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/widget/Custom_Arrow_back.dart';
import 'package:sehatak/core/widget/Custom_button.dart';
import 'package:sehatak/core/widget/custom_sized_box.dart';
import 'package:sehatak/core/utils/cache_helper.dart'; // استيراد CacheHelper

class PriceSelectionViewBody extends StatefulWidget {
  const PriceSelectionViewBody({super.key});

  @override
  State<PriceSelectionViewBody> createState() => _PriceSelectionViewBodyState();
}

class _PriceSelectionViewBodyState extends State<PriceSelectionViewBody> {
  int selectedWeight = 25; // قيمة افتراضية

  @override
  void initState() {
    super.initState();
    // استرجاع القيمة المحفوظة عند بدء الشاشة
    selectedWeight = CacheHelper.getData(key: 'selectedPrice') ?? 25;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpProviderCubit, SignUpProviderState>(
      listener: (context, state) {
        if (state is SignUpProviderSuccess) {
          customSnackBar(context, 'Success');
          Future.delayed(const Duration(seconds: 2), () {
            GoRouter.of(context).pushReplacement(AppRouter.kSuccessViewClient);
          });
        } else if (state is SignUpProviderFailure) {
          customSnackBar(context, state.errorMessage);
          Future.delayed(const Duration(seconds: 2), () {
            GoRouter.of(context).pushReplacement(AppRouter.kSignupViewClient);
          });
        }
      },
     child: BlocBuilder<WeightCubit, WeightState>(
  builder: (context, state) {
    // 🔹 استرجاع السعر المخزن عند تحميل الشاشة
    int selectedWeight = (state is WeightSelected) 
        ? state.weight 
        : int.tryParse(CacheHelper.getData(key: 'selectedPrice') ?? '25') ?? 25;

    return Form(
      key: context.read<SignUpProviderCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 32.h, left: 24.w),
            child: const CustomArrowBack(text: 'Back'),
          ),
          CustomSizedBox(height: 25.h),
          const CustomQuestionAndAswer(
            question: 'What Is Your Price?',
            answer: 'Lorem ipsum dolor sit amet...',
          ),
          CustomSizedBox(height: 35.h),
          CustomSliderWidget(
            dates: List.generate(19, (index) => 100 + (index * 50)),
            selectedDate: selectedWeight,
            unitSymbol: '\$',
            onDateSelected: (weight) {
              // 🔹 عند تغيير السعر، خزّنه في الكاش وحدّث الـ Cubit
              CacheHelper.saveData(key: 'selectedPrice', value: weight.toString());
              context.read<WeightCubit>().selectWeight(weight);
            },
          ),
          const Spacer(),
          CustomButton(
            text: 'Continue',
            onTap: () {
              if (context.read<SignUpProviderCubit>().formKey.currentState!.validate()) {
                context.read<SignUpProviderCubit>().signUpUser();
              } else {
                customSnackBar(context, 'Please fill in all required fields');
              }
            },
          ),
          CustomSizedBox(height: 40.h),
           ],
            ),
          );
        },
      ),
    );
  }
}