import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/chat/data/repo/chat_repo_impl.dart';
import 'package:sehatak/Features/chat/presentation/manger/addReview/add_review_cubit.dart';
import 'package:sehatak/Features/chat/presentation/manger/addReview/add_review_state.dart';
import 'package:sehatak/const.dart';
import 'package:sehatak/core/function/custom_snacbar.dart';
import 'package:sehatak/core/utils/api_service.dart';

class FeedbackBottomSheet extends StatefulWidget {
  final String bookingId;
  final String serviceProviderId;

  const FeedbackBottomSheet({
    super.key,
    required this.bookingId,
    required this.serviceProviderId,
  });

  @override
  State<FeedbackBottomSheet> createState() => _FeedbackBottomSheetState();
}

class _FeedbackBottomSheetState extends State<FeedbackBottomSheet> {
  final TextEditingController _commentController = TextEditingController();
  int _selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocConsumer<AddReviewCubit, AddReviewState>(
            listener: (context, state) {
              if (state is AddReviewSuccess) {
                showDialog(
                  context: context,
                  builder: (ctx) {
                    return AlertDialog(
                      title: const Text('THANK YOU'),
                      content: const Text('Your Feed Back Done'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                            Navigator.of(context).pop();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              } else if (state is AddReviewFailure) {
                customSnackBar(context, state.errorMessage);
              }
            },
            builder: (context, state) {
              return Row(
                children: [
                  Image.asset('assets/images/review.png',
                      height: 25, width: 25),
                  const SizedBox(width: 10),
                  const Text('Feed Back',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: state is AddReviewLoading || _selectedRating == 0
                        ? null
                        : () {
                            context.read<AddReviewCubit>().submitReview(
                                  comment: _commentController.text.trim(),
                                  rating: _selectedRating,
                                  serviceProviderId: widget.serviceProviderId,
                                );
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 6),
                      minimumSize: const Size(0, 0),
                    ),
                    child: state is AddReviewLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text('Done',
                            style:
                                TextStyle(color: Colors.white, fontSize: 13)),
                  ),
                ],
              );
            },
          ),
          const Divider(thickness: 1, color: Colors.grey, endIndent: 80),
          TextField(
            controller: _commentController,
            decoration: const InputDecoration(
              hintText: 'Write your feed back ...',
              border: InputBorder.none,
            ),
          ),
          const SizedBox(height: 50),
          const Row(
            children: [
              Icon(Icons.star, color: kPrimaryColor, size: 35),
              SizedBox(width: 10),
              Text('Rating',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ],
          ),
          const Divider(thickness: 1, color: Colors.grey, endIndent: 80),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(5, (index) {
              final value = index + 1;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedRating = value;
                  });
                },
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor:
                      _selectedRating == value ? kPrimaryColor : accentColor,
                  child: Text(
                    '$value',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

void showFeedbackBottomSheet(
  BuildContext context, {
  required String bookingId,
  required String serviceProviderId,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color(0xFFFDF6E4),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
    ),
    builder: (context) {
      final screenHeight = MediaQuery.of(context).size.height;
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: BlocProvider(
          create: (_) => AddReviewCubit(ChatRepoImpl(ApiService(Dio()))),
          child: SizedBox(
            height: screenHeight * 0.5,
            child: FeedbackBottomSheet(
              bookingId: bookingId,
              serviceProviderId: serviceProviderId,
            ),
          ),
        ),
      );
    },
  );
}
