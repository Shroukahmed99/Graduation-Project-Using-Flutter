import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_field.dart';
import 'package:sehatak/core/function/custom_snacbar.dart';
import 'package:sehatak/core/utils/app_router.dart';
import 'package:sehatak/core/widget/Custom_Arrow_back.dart';
import 'package:sehatak/core/widget/Custom_button.dart';
import 'package:sehatak/core/widget/custom_sized_box.dart';
import 'package:sehatak/Features/Questions/presentation/views/widget/custom_question_and_aswer.dart';

class InsertDataViewBody extends StatelessWidget {
  const InsertDataViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32.h, left: 24.w),
      child: Column(
        children: [
          const CustomArrowBack(text: 'Back'),
          CustomSizedBox(height: 25.h),
          const CustomQuestionAndAswer(
            question: 'Insert your Data',
            answer:
                'A service provider can be a Nutritionist, Physiotherapist, or Gym Coach',
          ),
          const CustomSizedBox(height: 54),
          const CustomTextField(
            title: 'years of experience',
            width: 77,
            hintText: '00',
          ),
          const CustomSizedBox(height: 10),
          const CustomTextField(
            title: 'Job Title',
            width: 146,
            hintText: 'Add Text',
          ),
          const CustomSizedBox(height: 10),
          const CustomTextField(
            title: 'Bio',
            width: 320,
            hintText: 'Add Text',
          ),
          const CustomSizedBox(height: 10),
          CVUploader(
            onFileSelected: (File? file) {
              if (file != null) {
                print("تم اختيار الملف: ${file.path}");
              } else {
                print("لم يتم اختيار أي ملف");
              }
            },
          ),
          const Spacer(),
          CustomButton(
            text: 'Continue',
            onTap: () {
              GoRouter.of(context).push(AppRouter.kPriceSelectionView);
            },
          ),
          CustomSizedBox(height: 40.h),
        ],
      ),
    );
  }
}

class CVUploader extends StatefulWidget {
  final Function(File?) onFileSelected;

  const CVUploader({Key? key, required this.onFileSelected}) : super(key: key);

  @override
  _CVUploaderState createState() => _CVUploaderState();
}

class _CVUploaderState extends State<CVUploader> {
  File? _cvFile;

  Future<void> _pickCVFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx'],
      );

      if (result != null && result.files.single.path != null) {
        File selectedFile = File(result.files.single.path!);

        if (!['pdf', 'doc', 'docx']
            .contains(selectedFile.path.split('.').last.toLowerCase())) {
          customSnackBar(
              context, 'An error occurred while selecting the file❌');
          return;
        }

        setState(() {
          _cvFile = selectedFile;
        });

        widget.onFileSelected(_cvFile);
      }
    } catch (e) {
      print("❌ حدث خطأ أثناء اختيار الملف: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft, // محاذاة المحتوى للأعلى واليسار
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // عدم تمديد العمود بالكامل
        children: [
          // 🔹 زر اختيار الملف (في البداية)
          ElevatedButton.icon(
            icon: const Icon(Icons.upload_file, color: Colors.black),
            label: const Text(
              "Upload CV",
              style: TextStyle(color: Colors.black),
            ),
            onPressed: _pickCVFile,
          ),

          // 🔹 عرض الملف إذا تم اختياره
          if (_cvFile != null) ...[
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.insert_drive_file, size: 30),
              title: Text(
                _cvFile!.path.split('/').last,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text("✅ File selected successfully"),
            ),

            // 🔹 زر تغيير الملف
            TextButton(
              child: const Text("Select Another File"),
              onPressed: _pickCVFile,
            ),
          ],
        ],
      ),
    );
  }
}
