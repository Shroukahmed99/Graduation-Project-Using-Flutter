class FitnessDataModel {
  final int steps;
  final int heartRate;
  final int calories;
  final int sleep;

  FitnessDataModel({
    required this.steps,
    required this.heartRate,
    required this.calories,
    required this.sleep,
  });

  factory FitnessDataModel.fromJson(Map<String, dynamic> json) {
    return FitnessDataModel(
      steps: (json['steps'] as List).isNotEmpty ? json['steps'][0]['value'] ?? 0 : 0,
      heartRate: (json['heartRate'] as List).isNotEmpty ? json['heartRate'][0]['value'] ?? 0 : 0,
      calories: (json['calories'] as List).isNotEmpty ? json['calories'][0]['value'] ?? 0 : 0,
      sleep: (json['sleep'] as List).isNotEmpty ? json['sleep'][0]['value'] ?? 0 : 0,
    );
  }
}
