import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sehatak/core/utils/cache_helper.dart';

part 'insert_data_state.dart';

class InsertDataCubit extends Cubit<InsertDataState> {
  InsertDataCubit() : super(InsertDataInitial()) {
    _resetFields(); // ✅ تعيين القيم الافتراضية دون تحميل البيانات المخزنة
  }

  final TextEditingController yearsController = TextEditingController();
  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  File? selectedFile;

  /// **إعادة تعيين الحقول للقيم الافتراضية**
  void _resetFields() {
    yearsController.text = ''; // ✅ ترك الحقول فارغة عند بدء التطبيق
    jobTitleController.text = '';
    bioController.text = '';
    selectedFile = null;
  }

  /// حفظ البيانات عند إدخالها
  void saveData(String key, String value) {
    CacheHelper.saveData(key: key, value: value);
  }

  /// اختيار ملف الصورة وحفظه
  Future<void> pickCVFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png'],
      );

      if (result != null && result.files.single.path != null) {
        selectedFile = File(result.files.single.path!);
        emit(InsertDataLoaded());
      }
    } catch (e) {
      print("❌ Error selecting file: $e");
    }
  }

  /// التحقق من اكتمال جميع البيانات قبل الانتقال
  bool isAllDataFilled() {
    return yearsController.text.isNotEmpty &&
        jobTitleController.text.isNotEmpty &&
        bioController.text.isNotEmpty &&
        selectedFile != null;
  }
}
