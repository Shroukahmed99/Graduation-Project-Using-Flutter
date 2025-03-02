import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'height_state.dart';

class HeightCubit extends Cubit<HeightState> {
  HeightCubit() : super(HeightInitial()) {
    loadSavedHeight();
  }

  Future<void> loadSavedHeight() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int savedHeight =
        int.tryParse(sharedPreferences.getString('height') ?? '145') ?? 145;
    emit(HeightSelected(savedHeight));
  }

  Future<void> selectHeight(int height) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('height', height.toString());
    emit(HeightSelected(height));
  }
}
