import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'role_cubit_state.dart';

class RoleCubitCubit extends Cubit<RoleCubitState> {
  RoleCubitCubit() : super(RoleCubitInitial());
}
