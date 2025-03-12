import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sehatak/core/utils/cache_helper.dart';

part 'insert_data_state.dart';

class InsertDataCubit extends Cubit<InsertDataState> {
  InsertDataCubit() : super(InsertDataInitial());

  final TextEditingController yearsController = TextEditingController();
  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  File? selectedFile;

  /// تحميل البيانات المخزنة
  Future<void> loadSavedData() async {
    yearsController.text = CacheHelper.getData(key: 'yearsOfExperience') ?? '';
    jobTitleController.text = CacheHelper.getData(key: 'jobTiltle') ?? '';
     jobTitleController.text = CacheHelper.getData(key: 'job') ?? '';
    bioController.text = CacheHelper.getData(key: 'bio') ?? '';

    String? savedPath = CacheHelper.getData(key: 'identifier');
    if (savedPath != null && File(savedPath).existsSync()) {
      selectedFile = File(savedPath);
    }
    emit(InsertDataLoaded());
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
        await CacheHelper.saveData(key: 'identifier', value: selectedFile!.path);
        emit(InsertDataLoaded());
      }
    } catch (e) {
      print("❌ Error selecting file: $e");
    }
  }
}
