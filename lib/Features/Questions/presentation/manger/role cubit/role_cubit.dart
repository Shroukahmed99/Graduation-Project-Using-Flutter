import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'role_state.dart';

class RoleCubit extends Cubit<RoleState> {
  RoleCubit() : super(RoleInitial()); // ✅ لا يوجد اختيار مبدئي

  Future<void> loadSavedRole() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? savedRole = sharedPreferences.getString('role');

    if (savedRole == 'Service Provider') {
      emit(RoleSelected(isProvider: true, isClient: false));
    } else if (savedRole == 'Client') {
      emit(RoleSelected(isProvider: false, isClient: true));
    } else {
      emit(RoleInitial()); // ✅ إذا لم يكن هناك دور محفوظ، تبقى الحالة كما هي
    }
  }

  Future<void> selectRole(String role) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('role', role);

    if (role == 'Service Provider') {
      emit(RoleSelected(isProvider: true, isClient: false));
    } else {
      emit(RoleSelected(isProvider: false, isClient: true));
    }
  }
}
