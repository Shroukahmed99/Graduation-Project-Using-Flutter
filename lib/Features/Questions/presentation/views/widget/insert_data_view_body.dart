import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/Questions/presentation/manger/isert%20data%20cubit/insert_data_cubit.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/custom_question_and_aswer.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_field.dart';
import 'package:sehatak/const.dart';
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const CustomArrowBack(text: 'Back'),
                  CustomSizedBox(height: 25.h),
                  const CustomQuestionAndAswer(
                    question: 'Insert your Data',
                  ),
                  const CustomSizedBox(height: 25),

                  /// Years of Experience
                  CustomTextField(
                    title: 'Years of Experience',
                    width: 77,
                    hintText: '00',
                    controller: cubit.yearsController,
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
                    onChanged: (value) => cubit.saveData('jobTiltle', value),
                  ),
                  const CustomSizedBox(height: 10),

                  /// Bio
                  CustomTextField(
                    title: 'Bio',
                    width: 320,
                    hintText: 'Add Text',
                    controller: cubit.bioController,
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
                  CustomButton(
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

class UploadImage extends StatelessWidget {
  const UploadImage({
    super.key,
    required this.cubit,
  });

  final InsertDataCubit cubit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: cubit.pickCVFile,
      child: Center(
        child: Container(
          width: 320,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: cubit.selectedFile == null
              ? const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cloud_upload, size: 50, color: kPrimaryColor),
                    SizedBox(height: 10),
                    Text(
                      "Certificate or Medical license",
                      style: TextStyle(fontSize: 16, color: kPrimaryColor),
                    ),
                  ],
                )
              : Stack(
                  alignment: Alignment.topRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        cubit.selectedFile!,
                        width: double.infinity,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.cancel, color: Colors.red),
                      onPressed: () {
                        cubit.selectedFile = null;
                        cubit.emit(InsertDataLoaded()); // تحديث الواجهة
                      },
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
