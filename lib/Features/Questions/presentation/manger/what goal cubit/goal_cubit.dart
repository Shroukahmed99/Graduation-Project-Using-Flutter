import 'package:bloc/bloc.dart';
import 'package:sehatak/core/utils/cache_helper.dart';

part 'goal_state.dart';

class GoalCubit extends Cubit<GoalState> {
  GoalCubit() : super(GoalSelected(""));

  Future<void> selectGoal(String goal) async {
    await CacheHelper.saveData(key: 'goal', value: goal);
    emit(GoalSelected(goal));
  }
}
