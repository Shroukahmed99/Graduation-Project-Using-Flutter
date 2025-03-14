import 'package:bloc/bloc.dart';
import 'package:sehatak/core/utils/cache_helper.dart';

part 'age_state.dart';

class AgeCubit extends Cubit<AgeState> {
  int _selectedAge = 25;

  AgeCubit() : super(AgeInitial()) {
    loadSavedAge();
  }

  Future<void> loadSavedAge() async {
    String? savedAgeData = CacheHelper.getData(key: 'age') as String?;
    int savedAge = int.tryParse(savedAgeData ?? '') ?? 25;
    _selectedAge = savedAge;
    emit(AgeSelected(_selectedAge));
  }

  void updateSelectedAge(int age) {
    _selectedAge = age;
    emit(AgeSelected(_selectedAge));
  }

  Future<void> saveSelectedAge() async {
    await CacheHelper.saveData(key: 'age', value: _selectedAge.toString());
  }
}
