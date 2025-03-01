import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/Questions/presentation/manger/gender/gender_cubit.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/circle_icon_text_widget.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/custom_question_and_aswer.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/widget/Custom_Arrow_back.dart';
import 'package:sehatak/core/widget/Custom_button.dart';
import 'package:sehatak/core/widget/custom_sized_box.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GenderSelectionView extends StatelessWidget {
  const GenderSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenderCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Select Your Gender'),
          centerTitle: true,
        ),
        body: BlocBuilder<GenderCubit, GenderState>(
          builder: (context, state) {
            var cubit = BlocProvider.of<GenderCubit>(context);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Choose your Gender:',
                  style: TextStyle(fontSize: 22),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => cubit.selectGender('Male'),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: state is GenderSelected && state.gender == 'Male'
                              ? Colors.blue
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text('Male'),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => cubit.selectGender('Female'),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: state is GenderSelected && state.gender == 'Female'
                              ? Colors.pink
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text('Female'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (state is GenderSelected) {
              GoRouter.of(context).push(AppRouter.kAgeSelectionScreen);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please select your gender'),
                        ),
                      );
                    }
                  },
                  child: const Text('Continue'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}