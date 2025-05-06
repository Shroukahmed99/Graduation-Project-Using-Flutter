import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileImageCubit extends Cubit<File?> {
  ProfileImageCubit() : super(null);

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      await _saveImagePath(file.path);
      await _setNotNewUser(); // المستخدم اختار صورة، لم يعد جديد
      emit(file);
    }
  }

  Future<void> loadSavedImage() async {
    final prefs = await SharedPreferences.getInstance();
    final isNewUser = prefs.getBool('is_new_user') ?? true;

    if (isNewUser) {
      emit(null); // لا يتم تحميل صورة ← تظهر أيقونة الشخص فقط
      return;
    }

    final imagePath = prefs.getString('profile_image_path');
    if (imagePath != null) {
      emit(File(imagePath));
    }
  }

  Future<void> _saveImagePath(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profile_image_path', path);
  }

  Future<void> _setNotNewUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_new_user', false);
  }

  /// ✅ هذه هي الدالة اللي كانت ناقصة وتسبب الخطأ
  Future<void> setAsNewUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_new_user', true);
  }
}
