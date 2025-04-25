// home_service_tab_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeServiceTabCubit extends Cubit<bool> {
  HomeServiceTabCubit() : super(false);

  void showCustomers() => emit(false);
  void showNewCustomers() => emit(true);
}
