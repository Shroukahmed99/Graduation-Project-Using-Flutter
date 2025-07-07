import 'package:bloc/bloc.dart';
import 'package:sehatak/core/utils/cache_helper.dart';
part 'gender_state.dart';

class GenderCubit extends Cubit<GenderState> {
  GenderCubit() : super(GenderInitial());

  Future<void> loadSavedGender() async {
    String? savedGender = CacheHelper.getData(key: 'gender');

    if (savedGender != null) {
      emit(GenderSelected(savedGender));
    }
  }

  Future<void> selectGender(String gender) async {
    await CacheHelper.saveData(key: 'gender', value: gender);
    await CacheHelper.saveData(
        key: 'genderInt', value: gender == 'male' ? 1 : 0);

    emit(GenderSelected(gender));
  }
}
