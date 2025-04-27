import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/home/presentation/manger/physical%20more/physical_more_cubit.dart';
import 'package:sehatak/Features/home/presentation/views/widget/details%20widget/custom_app_bar_details.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/widget/custom_buttom_book_now.dart';
import 'package:sehatak/Features/home/presentation/views/widget/details%20widget/feedback_section_physical.dart';
import 'package:sehatak/Features/home/presentation/views/widget/details%20widget/info_data_physical.dart';
import 'package:sehatak/core/function/custom_snacbar.dart';

class DetailsPhysicalViewBody extends StatelessWidget {
  final String physicalId;

  const DetailsPhysicalViewBody({super.key, required this.physicalId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhysicalMoreCubit, PhysicalMoreState>(
      builder: (context, state) {
        if (state is PhysicalMoreLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PhysicalMoreSuccess) {
          final physicalist = state.physicalTherapistMore;

          return Padding(
            padding: EdgeInsets.only(top: 15.h),
            child: Column(
              children: [
                const CustomAppBarDetails(
                  title: 'Physical Therapy',
                  image: 'assets/images/category3.png',
                ),
                SizedBox(height: 20.h),
                InfoDataPhysical(
                  physicalTherapistMore: physicalist,
                ),
                FeedbackSectionPhysical(reviews: physicalist.reviews),
                const Spacer(),
                CustomButtomBookNow(
                  text: 'BOOK NOW',
                  onTap: () {
                    GoRouter.of(context).push(
                      AppRouter.kPaymentView,
                      extra: {
                        'priceRange': physicalist.priceRange.toString(),
                        'id': physicalist.id,
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 10.h,
                )
              ],
            ),
          );
        } else if (state is PhysicalMoreFailure) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            customSnackBar(context, state.message);
          });
          return const SizedBox.shrink();
        } else {
          return const Center(child: Text('Unexpected error occurred.'));
        }
      },
    );
  }
}
