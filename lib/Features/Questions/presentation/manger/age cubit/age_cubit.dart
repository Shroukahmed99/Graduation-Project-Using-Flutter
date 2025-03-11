import 'package:bloc/bloc.dart';
import 'package:sehatak/core/utils/cache_helper.dart';

part 'age_state.dart';

class AgeCubit extends Cubit<AgeState> {
  AgeCubit() : super(AgeInitial()) {
    loadSavedAge(); // ✅ تحميل العمر عند تشغيل التطبيق
  }

  Future<void> loadSavedAge() async {
    String? savedAgeData = CacheHelper.getData(key: 'age') as String?;
    print('🔹 Retrieved Age from Cache: $savedAgeData'); 

    int savedAge = int.tryParse(savedAgeData ?? '') ?? 25; // تحويل String إلى int مع قيمة افتراضية
    emit(AgeSelected(savedAge)); 
  }

  Future<void> selectAge(int age) async {
    String ageString = age.toString(); // ✅ تحويل العمر إلى String قبل التخزين
    bool isSaved = await CacheHelper.saveData(key: 'age', value: ageString);
    print('✅ Age Saved: $isSaved, Value: $ageString');

    if (isSaved) {
      emit(AgeSelected(age)); // ✅ تحديث الحالة عند نجاح الحفظ
    } else {
      print('❌ Failed to save age');
    }
  }
}
