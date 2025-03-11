import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sehatak/core/utils/cache_helper.dart';

part 'weight_state.dart';

class WeightCubit extends Cubit<WeightState> {
  WeightCubit() : super(WeightInitial()) {
    loadSavedWeight();
  }

  Future<void> loadSavedWeight() async {
    var savedWeight = CacheHelper.getData(key: 'weight');
    
    // تأكد من تحويل القيمة إلى int بشكل آمن
    int weight = (savedWeight is int) ? savedWeight : int.tryParse(savedWeight?.toString() ?? '') ?? 70;
    
    emit(WeightSelected(weight));
  }

  Future<void> selectWeight(int weight) async {
    bool success = await CacheHelper.saveData(key: 'weight', value: weight);
    if (success) {
      print("✅ Weight saved successfully: $weight");
      emit(WeightSelected(weight));
    } else {
      print("❌ Failed to save weight");
    }
  }
}
