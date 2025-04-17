class NutritionModel {
  final String id;
  final String fullName;
  final String bio;
  final int priceRange;
  final double? ratingAverage;

  NutritionModel({
    this.ratingAverage,
    required this.id,
    required this.fullName,
    required this.bio,
    required this.priceRange,
  });

  factory NutritionModel.fromJson(Map<String, dynamic> json) {
    return NutritionModel(
      id: json['_id'],
      fullName: json['fullName'],
      bio: json['bio'],
      priceRange: json['priceRange'],
      ratingAverage: json['ratingAverage'] != null
          ? (json['ratingAverage'] as num).toDouble()
          : null,
    );
  }
}

class NutritionistsResponse {
  final String status;
  final int results;
  final List<NutritionModel> nutritionists;

  NutritionistsResponse({
    required this.status,
    required this.results,
    required this.nutritionists,
  });

  factory NutritionistsResponse.fromJson(Map<String, dynamic> json) {
    var nutritionistList = (json['data']['Nutritionists'] as List)
        .map((item) => NutritionModel.fromJson(item))
        .toList();

    return NutritionistsResponse(
      status: json['status'],
      results: json['results'],
      nutritionists: nutritionistList,
    );
  }
}
