import 'package:bloc/bloc.dart';
import 'package:sehatak/core/utils/cache_helper.dart'; // ✅ استيراد CacheHelper

part 'goal_state.dart';

class GoalCubit extends Cubit<GoalState> {
  GoalCubit() : super(GoalSelected("")) {
    loadSavedGoal();
  }

  Future<void> loadSavedGoal() async {
    String savedGoal = CacheHelper.getData(key: 'goal') ?? "";
    emit(GoalSelected(savedGoal));
  }

  Future<void> selectGoal(String goal) async {
    await CacheHelper.saveData(key: 'goal', value: goal);
    emit(GoalSelected(goal));
  }
}
