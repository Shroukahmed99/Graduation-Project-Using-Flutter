import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/Questions/presentation/manger/isert%20data%20cubit/insert_data_cubit.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/custom_question_and_aswer.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_field.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/widget/Custom_Arrow_back.dart';
import 'package:sehatak/core/widget/Custom_button.dart';
import 'package:sehatak/core/widget/custom_sized_box.dart';
import 'package:sehatak/core/function/custom_snacbar.dart';

class InsertDataViewBody extends StatelessWidget {
  const InsertDataViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InsertDataCubit, InsertDataState>(
      builder: (context, state) {
        final cubit = context.read<InsertDataCubit>();

        return Padding(
          padding: EdgeInsets.only(top: 32.h, left: 24.w, right: 24.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomArrowBack(text: 'Back'),
                CustomSizedBox(height: 25.h),
                const CustomQuestionAndAswer(
                  question: 'Insert your Data',
                  answer:
                      'A service provider can be a Nutritionist, Physiotherapist, or Gym Coach',
                ),
                const CustomSizedBox(height: 54),

                CustomTextField(
                  title: 'Years of Experience',
                  width: 77,
                  hintText: '00',
                  controller: cubit.yearsController,
                  onChanged: (value) =>
                      cubit.saveData('yearsOfExperience', value),
                ),
                const CustomSizedBox(height: 10),

                CustomTextField(
                  title: 'Job Title',
                  width: 146,
                  hintText: 'Add Text',
                  controller: cubit.jobTitleController,
                  onChanged: (value) => cubit.saveData('jobTitle', value),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(Icons.upload_file, color: Colors.black),
                      label: const Text(
                        "Upload Image",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: cubit.pickCVFile,
                    ),
                    if (cubit.selectedFile != null) ...[
                      const SizedBox(height: 10),
                      ListTile(
                        leading: const Icon(Icons.image, size: 30),
                        title: Text(
                          cubit.selectedFile!.path.split('/').last,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text("✅ File selected successfully"),
                      ),
                    ],
                  ],
                ),

                const SizedBox(height: 20),
                CustomButton(
                  text: 'Continue',
                  onTap: () {
                    if (!cubit.isAllDataFilled()) {
                      customSnackBar(context,
                          '⚠️ Please fill in all fields before continuing!');
                    } else {
                      GoRouter.of(context).push(AppRouter.kPriceSelectionView);
                    }
                  },
                ),
                CustomSizedBox(height: 40.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
