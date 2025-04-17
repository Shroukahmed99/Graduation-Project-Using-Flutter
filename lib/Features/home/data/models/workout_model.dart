class CoachModel {
  final String id;
  final String fullName;
  final String bio;
  final int priceRange;
  final double? ratingAverage;

  CoachModel({
    required this.id,
    required this.fullName,
    required this.bio,
    required this.priceRange,
    this.ratingAverage,
  });

  factory CoachModel.fromJson(Map<String, dynamic> json) {
    return CoachModel(
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

class CoachesResponse {
  final String status;
  final int results;
  final List<CoachModel> coaches;

  CoachesResponse({
    required this.status,
    required this.results,
    required this.coaches,
  });

  factory CoachesResponse.fromJson(Map<String, dynamic> json) {
    var coachesList = (json['data']['coaches'] as List)
        .map((coach) => CoachModel.fromJson(coach))
        .toList();

    return CoachesResponse(
      status: json['status'],
      results: json['results'],
      coaches: coachesList,
    );
  }
}
