import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'age_state.dart';

class AgeCubit extends Cubit<AgeState> {
  AgeCubit() : super(AgeInitial()) {
    loadSavedAge();
  }

  Future<void> loadSavedAge() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String savedAgeString = sharedPreferences.getString('age') ?? '25';
    int savedAge = int.tryParse(savedAgeString) ?? 25;

    emit(AgeSelected(savedAge));
  }

  Future<void> selectAge(int age) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setString('age', age.toString());
    emit(AgeSelected(age));
  }
}
