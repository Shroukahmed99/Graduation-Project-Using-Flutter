import 'package:bloc/bloc.dart';
import 'package:sehatak/core/utils/cache_helper.dart';

part 'age_state.dart';

class AgeCubit extends Cubit<AgeState> {
  int _selectedAge = 25; // ✅ متغير لتخزين القيمة المحددة حاليًا

  AgeCubit() : super(AgeInitial()) {
    loadSavedAge();
  }

  Future<void> loadSavedAge() async {
    String? savedAgeData = CacheHelper.getData(key: 'age') as String?;
    int savedAge = int.tryParse(savedAgeData ?? '') ?? 25;
    _selectedAge = savedAge; // ✅ تحديث القيمة الافتراضية
    print('🔹 Retrieved Age from Cache: $_selectedAge');
    emit(AgeSelected(_selectedAge));
  }

  void updateSelectedAge(int age) {
    _selectedAge = age; // ✅ تحديث القيمة المخزنة
    print('📌 Selected Age: $_selectedAge');
    emit(AgeSelected(_selectedAge)); // ✅ تحديث الواجهة
  }

  Future<void> saveSelectedAge() async {
    bool isSaved = await CacheHelper.saveData(key: 'age', value: _selectedAge.toString());
    if (isSaved) {
      print('✅ Saved Age in Cache: $_selectedAge'); // ✅ طباعة العمر الفعلي المخزن
    } else {
      print('❌ Failed to save age');
    }
  }
}
