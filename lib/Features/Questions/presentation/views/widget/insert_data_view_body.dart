import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sehatak/Features/auth/Presentation/views/widget/custom_text_field.dart';
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
          const CustomSizedBox(height: 16),
          const CustomTextField(
            title: 'Job Title',
            width: 146,
            hintText: 'Add Text',
          ),
          const CustomSizedBox(height: 16),
          const CustomTextField(
            title: 'Qualifications',
            width: 320,
            hintText: 'Add Text',
          ),
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
  final Function(File?) onFileSelected; // تمرير الملف المُختار

  const CVUploader({Key? key, required this.onFileSelected}) : super(key: key);

  @override
  _CVUploaderState createState() => _CVUploaderState();
}

class _CVUploaderState extends State<CVUploader> {
  File? _cvFile; // تخزين الملف المختار

  Future<void> _pickCVFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'], // السماح بملفات CV فقط
    );

    if (result != null) {
      setState(() {
        _cvFile = File(result.files.single.path!);
      });
      widget.onFileSelected(_cvFile); // إرجاع الملف للمُستدعي
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 🔹 عرض اسم الملف أو رسالة في حالة عدم الاختيار
        _cvFile != null
            ? ListTile(
                leading: Icon(Icons.insert_drive_file,
                    size: 50, color: Colors.white),
                title: Text(_cvFile!.path.split('/').last), // عرض اسم الملف فقط
                subtitle: Text("File selected successfully"),
              )
            : Text("No file selected", style: TextStyle(fontSize: 16)),

        SizedBox(height: 10),

        // 🔹 زر رفع الملف
        ElevatedButton.icon(
          icon: Icon(Icons.upload_file),
          label: Text(
            "Upload CV",
            style: TextStyle(color: Colors.black),
          ),
          onPressed: _pickCVFile,
        ),

        // 🔹 زر لإعادة تحميل ملف آخر
        if (_cvFile != null) ...[
          SizedBox(height: 10),
          TextButton(
            child: Text("Select Another File"),
            onPressed: _pickCVFile,
          ),
        ],
      ],
    );
  }
}
