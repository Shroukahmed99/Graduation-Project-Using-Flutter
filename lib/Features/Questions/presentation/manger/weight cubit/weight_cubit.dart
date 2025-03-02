import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'weight_state.dart';

class WeightCubit extends Cubit<WeightState> {
  WeightCubit() : super(WeightInitial()) {
    loadSavedWeight();
  }

  Future<void> loadSavedWeight() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int savedWeight =
        int.tryParse(sharedPreferences.getString('weight') ?? '25') ?? 25;
    emit(WeightSelected(savedWeight));
  }

  Future<void> selectWeight(int weight) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('weight', weight.toString());
    emit(WeightSelected(weight));
  }
}
