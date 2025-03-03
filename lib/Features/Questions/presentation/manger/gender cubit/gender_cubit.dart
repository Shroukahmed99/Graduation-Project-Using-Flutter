import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'gender_state.dart';

class GenderCubit extends Cubit<GenderState> {
  GenderCubit() : super(GenderInitial()); // ✅ الحالة الافتراضية بدون تحديد جنس

  Future<void> loadSavedGender() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? savedGender = sharedPreferences.getString('gender');

    if (savedGender != null) {
      emit(
          GenderSelected(savedGender)); // ✅ تحديد الجنس فقط إذا كان مخزن مسبقًا
    }
  }

  Future<void> selectGender(String gender) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('gender', gender);
    emit(GenderSelected(gender)); // ✅ تحديث الحالة عند اختيار الجنس
  }
}
