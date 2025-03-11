import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sehatak/core/utils/cache_helper.dart';

part 'height_state.dart';

class HeightCubit extends Cubit<HeightState> {
  HeightCubit() : super(HeightInitial()) {
    loadSavedHeight();
  }

  Future<void> loadSavedHeight() async {
    int savedHeight = CacheHelper.getData(key: 'height') != null
        ? int.tryParse(CacheHelper.getData(key: 'height').toString()) ?? 145
        : 145;
    emit(HeightSelected(savedHeight)); // تأكدنا أن القيمة من النوع int
  }

  Future<void> selectHeight(int height) async {
    bool success = await CacheHelper.saveData(key: 'height', value: height);
    if (success) {
      print("✅ Height saved successfully: $height");
      emit(HeightSelected(height));
    } else {
      print("❌ Failed to save height");
    }
  }
}
