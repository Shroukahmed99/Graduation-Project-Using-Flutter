import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sehatak/core/utils/cache_helper.dart';

part 'role_state.dart';

class RoleCubit extends Cubit<RoleState> {
  RoleCubit() : super(RoleInitial()); // ✅ لا يوجد اختيار مبدئي

  Future<void> loadSavedRole() async {
    String? savedRole = CacheHelper.getData(key: 'role');

    if (savedRole == 'Service Provider') {
      emit(RoleSelected(isProvider: true, isClient: false));
    } else if (savedRole == 'Client') {
      emit(RoleSelected(isProvider: false, isClient: true));
    } else {
      emit(RoleInitial()); // ✅ إذا لم يكن هناك دور محفوظ، تبقى الحالة كما هي
    }
  }

  Future<void> selectRole(String role) async {
    await CacheHelper.saveData(key: 'role', value: role);

    if (role == 'Service Provider') {
      emit(RoleSelected(isProvider: true, isClient: false));
    } else {
      emit(RoleSelected(isProvider: false, isClient: true));
    }
  }
}
