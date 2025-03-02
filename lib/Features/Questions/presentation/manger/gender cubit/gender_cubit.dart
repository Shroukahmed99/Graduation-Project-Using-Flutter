import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'gender_state.dart';

class GenderCubit extends Cubit<GenderState> {
  GenderCubit() : super(GenderInitial()) {
    loadSavedGender();
  }

  Future<void> loadSavedGender() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? savedGender = sharedPreferences.getString('gender');
    if (savedGender != null) {
      emit(GenderSelected(savedGender));
    }
  }

  Future<void> selectGender(String gender) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('gender', gender);
    emit(GenderSelected(gender));
  }
}
