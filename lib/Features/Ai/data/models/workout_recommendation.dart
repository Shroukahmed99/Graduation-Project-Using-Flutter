class WorkoutRecommendation {
  final String exercisePlan;
  final String category;
  final String impactLevel;
  final String totalPlanDuration;
  final String caloriesBurned;
  final String targetMuscleGroup;

  WorkoutRecommendation({
    required this.exercisePlan,
    required this.category,
    required this.impactLevel,
    required this.totalPlanDuration,
    required this.caloriesBurned,
    required this.targetMuscleGroup,
  });

  factory WorkoutRecommendation.fromJson(Map<String, dynamic> json) {
    return WorkoutRecommendation(
      exercisePlan: json['Exercise Plan'],
      category: json['Category'],
      impactLevel: json['Impact Level'],
      totalPlanDuration: json['Total Plan Duration (minutes)'],
      caloriesBurned: json['Calories Burned (Plan)'],
      targetMuscleGroup: json['Target Muscle Group'],
    );
  }
}
