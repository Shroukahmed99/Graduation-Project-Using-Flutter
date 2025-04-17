class MoreNutrition {
  final String id;
  final String email;
  final String role;
  final DateTime createdAt;

  const MoreNutrition({
    required this.id,
    required this.email,
    required this.role,
    required this.createdAt,
  });

  factory MoreNutrition.fromJson(Map<String, dynamic> json) {
    return MoreNutrition(
      id: json['_id'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] ?? '',
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'email': email,
      'role': role,
      'createdAt': createdAt.toIso8601String(),
    };
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
  final int ratingQuantity;
  final List<dynamic> reviews;
  final String role;
  final String username;

  const NutritionistMore({
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
    required this.ratingQuantity,
    required this.reviews,
    required this.role,
    required this.username,
  });

  factory NutritionistMore.fromJson(Map<String, dynamic> json) {
    return NutritionistMore(
      id: json['_id'] ?? '',
      user: MoreNutrition.fromJson(json['userId'] ?? {}),
      fullName: json['fullName'] ?? '',
      mobileNumber: json['mobileNumber'] ?? '',
      job: json['job'] ?? '',
      gender: json['gender'] ?? '',
      age: json['age'] ?? '',
      yearsOfExperience: json['yearsOfExperience'] ?? '',
      jobTitle: json['jobTitle'] ?? '',
      bio: json['bio'] ?? '',
      identifier: json['identifier'] ?? '',
      priceRange: json['priceRange'] ?? 0,
      ratingQuantity: json['ratingQuantity'] ?? 0,
      reviews: json['reviews'] ?? [],
      role: json['role'] ?? '',
      username: json['username'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userId': user.toJson(),
      'fullName': fullName,
      'mobileNumber': mobileNumber,
      'job': job,
      'gender': gender,
      'age': age,
      'yearsOfExperience': yearsOfExperience,
      'jobTitle': jobTitle,
      'bio': bio,
      'identifier': identifier,
      'priceRange': priceRange,
      'ratingQuantity': ratingQuantity,
      'reviews': reviews,
      'role': role,
      'username': username,
    };
  }
}

class NutritionistResponse {
  final String status;
  final NutritionistMore nutritionist;

  const NutritionistResponse({
    required this.status,
    required this.nutritionist,
  });

  factory NutritionistResponse.fromJson(Map<String, dynamic> json) {
    return NutritionistResponse(
      status: json['status'] ?? '',
      nutritionist:
          NutritionistMore.fromJson(json['data']['Nutritionist'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': {
        'Nutritionist': nutritionist.toJson(),
      },
    };
  }
}
