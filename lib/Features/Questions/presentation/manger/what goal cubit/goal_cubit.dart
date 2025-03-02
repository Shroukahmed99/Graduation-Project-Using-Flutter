import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'goal_state.dart';

class GoalCubit extends Cubit<GoalState> {
  GoalCubit() : super(GoalInitial()) {
    loadSavedGoal();
  }

  Future<void> loadSavedGoal() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String savedGoal = sharedPreferences.getString('goal') ?? "";
    emit(GoalSelected(savedGoal));
  }

  Future<void> selectGoal(String goal) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('goal', goal);
    emit(GoalSelected(goal));
  }
}
