import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/Questions/presentation/manger/isert%20data%20cubit/insert_data_cubit.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/custom_question_and_aswer.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/upload_image.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_field.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/widget/Custom_Arrow_back.dart';
import 'package:sehatak/core/widget/Custom_button.dart';
import 'package:sehatak/core/widget/custom_sized_box.dart';

class InsertDataViewBody extends StatelessWidget {
  const InsertDataViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InsertDataCubit, InsertDataState>(
      builder: (context, state) {
        final cubit = context.read<InsertDataCubit>();

        return PopScope(
          onPopInvoked: (didPop) {
            if (didPop) {
              cubit.clearData(); // مسح البيانات عند الخروج
            }
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 32.h, left: 24.w),
              child: Column(
                children: [
                  const CustomArrowBack(text: 'Back'),
                  CustomSizedBox(height: 40.h),
                  const CustomQuestionAndAswer(
                    question: 'Insert your Data',
                  ),
                  const CustomSizedBox(height: 50),

                  /// Years of Experience
                  CustomTextField(
                    title: 'Years of Experience',
                    width: 77,
                    hintText: '00',
                    controller: cubit.yearsController,
                    isNumeric: true,
                    onChanged: (value) =>
                        cubit.saveData('yearsOfExperience', value),
                  ),

                  const CustomSizedBox(height: 10),

                  /// Job Title
                  CustomTextField(
                    title: 'Job Title',
                    width: 146,
                    hintText: 'Add Text',
                    controller: cubit.jobTitleController,
                    isAlpha: true,
                    onChanged: (value) => cubit.saveData('jobTitle', value),
                  ),
                  const CustomSizedBox(height: 10),

                  CustomTextField(
                    title: 'Bio',
                    width: 320,
                    hintText: 'Add Text',
                    controller: cubit.bioController,
                    isAlpha: true,
                    onChanged: (value) => cubit.saveData('bio', value),
                  ),

                  const CustomSizedBox(height: 10),

                  /// CV Uploader
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "identifier ",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'League Spartan',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  UploadImage(cubit: cubit),

                  const SizedBox(height: 20),
                  CustomButtom(
                    text: 'Continue',
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kPriceSelectionView);
                    },
                  ),
                  CustomSizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
