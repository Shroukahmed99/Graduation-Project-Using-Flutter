import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/Questions/presentation/manger/price%20cubit/price_cubit.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/custom_question_and_aswer.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/custom_slider_widget.dart';
import 'package:sehatak/Features/auth/Presentation/manger/signup%20cubits/signup%20provider/sign_up_provider_cubit.dart';
import 'package:sehatak/Features/auth/Presentation/manger/signup%20cubits/signup%20provider/sign_up_provider_state.dart';
import 'package:sehatak/core/function/custom_snacbar.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/widget/Custom_Arrow_back.dart';
import 'package:sehatak/core/widget/Custom_button.dart';
import 'package:sehatak/core/widget/custom_sized_box.dart';
import 'package:sehatak/core/utils/cache_helper.dart';

class PriceSelectionViewBody extends StatelessWidget {
  const PriceSelectionViewBody({super.key});

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
      child: BlocBuilder<PriceCubit, PriceState>(
        builder: (context, state) {
          int selectedPrice = (state is PriceSelected)
              ? state.price
              : int.tryParse(CacheHelper.getData(key: 'priceRange') ?? '100') ??
                  100;
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
                  question: 'What is your price range?',
                  answer:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                ),
                CustomSizedBox(height: 35.h),
                CustomSliderWidget(
                  initialValue: 0, // القيمة الابتدائية
                  step: 50, // قيمة التزايد
                  maxValue: 900, // القيمة النهائية
                  selectedDate: selectedPrice,
                  unitSymbol: '\$',
                  onDateSelected: (price) {
                    CacheHelper.saveData(
                      key: 'priceRange',
                      value: price.toString(),
                    );
                    context.read<PriceCubit>().selectPrice(price);
                  },
                ),
                const Spacer(),
                BlocBuilder<SignUpProviderCubit, SignUpProviderState>(
                  builder: (context, state) {
                    bool isLoading = state is SignUpProviderLoading;

                    return isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : CustomButton(
                            text: 'Continue',
                            onTap: () {
                              if (context
                                  .read<SignUpProviderCubit>()
                                  .formKey
                                  .currentState!
                                  .validate()) {
                                if (selectedPrice != null) {
                                  context
                                      .read<SignUpProviderCubit>()
                                      .signUpUser();
                                } else {
                                  customSnackBar(
                                      context, 'Please select activity level');
                                }
                              }
                            },
                          );
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
