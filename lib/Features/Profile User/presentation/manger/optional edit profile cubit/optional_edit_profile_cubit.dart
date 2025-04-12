import 'package:flutter_bloc/flutter_bloc.dart';

class OptionalEditProfileCubit extends Cubit<void> {
  OptionalEditProfileCubit() : super(null);

  String? selectedActivityLevel;
  String? selectedFitnessGoal;

  void updateActivityLevel(String? level) {
    selectedActivityLevel = level;
    emit(null);
  }

  void updateFitnessGoal(String? goal) {
    selectedFitnessGoal = goal;
    emit(null);
  }
}
