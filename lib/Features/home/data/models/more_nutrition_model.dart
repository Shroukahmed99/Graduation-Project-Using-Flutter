class MoreNutrition {
  final String id;
  final String email;
  final String role;
  final DateTime createdAt;

  MoreNutrition({
    required this.id,
    required this.email,
    required this.role,
    required this.createdAt,
  });

  factory MoreNutrition.fromJson(Map<String, dynamic> json) {
    return MoreNutrition(
      id: json['_id'],
      email: json['email'],
      role: json['role'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}

class NutritionistMore {
  final String id;
  final MoreNutrition user;
  final String fullName;
  final String mobileNumber;
  final String job;
  final String gender;
  final String age;
  final String yearsOfExperience;
  final String jobTitle;
  final String bio;
  final String identifier;
  final int priceRange;
  final String role;
  final String username;

  NutritionistMore({
    required this.id,
    required this.user,
    required this.fullName,
    required this.mobileNumber,
    required this.job,
    required this.gender,
    required this.age,
    required this.yearsOfExperience,
    required this.jobTitle,
    required this.bio,
    required this.identifier,
    required this.priceRange,
    required this.role,
    required this.username,
  });

  factory NutritionistMore.fromJson(Map<String, dynamic> json) {
    return NutritionistMore(
      id: json['_id'],
      user: MoreNutrition.fromJson(json['userId']),
      fullName: json['fullName'],
      mobileNumber: json['mobileNumber'],
      job: json['job'],
      gender: json['gender'],
      age: json['age'],
      yearsOfExperience: json['yearsOfExperience'],
      jobTitle: json['jobTitle'],
      bio: json['bio'],
      identifier: json['identifier'],
      priceRange: json['priceRange'],
      role: json['role'],
      username: json['username'],
    );
  }
}

class NutritionistResponse {
  final String status;
  final NutritionistMore nutritionist;

  NutritionistResponse({
    required this.status,
    required this.nutritionist,
  });

  factory NutritionistResponse.fromJson(Map<String, dynamic> json) {
    return NutritionistResponse(
      status: json['status'],
      nutritionist: NutritionistMore.fromJson(json['data']['Nutritionist']),
    );
  }
}
