class Coach {
  final String id;
  final String fullName;
  final String bio;
  final int priceRange;

  Coach({
    required this.id,
    required this.fullName,
    required this.bio,
    required this.priceRange,
  });

  factory Coach.fromJson(Map<String, dynamic> json) {
    return Coach(
      id: json['_id'],
      fullName: json['fullName'],
      bio: json['bio'],
      priceRange: json['priceRange'],
    );
  }
}

class CoachesResponse {
  final String status;
  final int results;
  final List<Coach> coaches;

  CoachesResponse({
    required this.status,
    required this.results,
    required this.coaches,
  });

  factory CoachesResponse.fromJson(Map<String, dynamic> json) {
    var coachesList = (json['data']['coaches'] as List)
        .map((coach) => Coach.fromJson(coach))
        .toList();

    return CoachesResponse(
      status: json['status'],
      results: json['results'],
      coaches: coachesList,
    );
  }
}
