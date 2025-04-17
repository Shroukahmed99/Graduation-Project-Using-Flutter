class MoreCoach {
  final String id;
  final String email;
  final String role;
  final DateTime createdAt;

  const MoreCoach({
    required this.id,
    required this.email,
    required this.role,
    required this.createdAt,
  });

  factory MoreCoach.fromJson(Map<String, dynamic> json) {
    return MoreCoach(
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

class CoachMoreId {
  final String id;
  final MoreCoach user;
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
  final String role;
  final String username;
  final List<dynamic> reviews;

  const CoachMoreId({
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
    required this.role,
    required this.username,
    required this.reviews,
  });

  factory CoachMoreId.fromJson(Map<String, dynamic> json) {
    return CoachMoreId(
      id: json['_id'] ?? '',
      user: MoreCoach.fromJson(json['userId'] ?? {}),
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
      role: json['role'] ?? '',
      username: json['username'] ?? '',
      reviews: json['reviews'] ?? [],
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
      'role': role,
      'username': username,
      'reviews': reviews,
    };
  }
}

class CoachResponse {
  final String status;
  final CoachMoreId coach;

  const CoachResponse({
    required this.status,
    required this.coach,
  });

  factory CoachResponse.fromJson(Map<String, dynamic> json) {
    return CoachResponse(
      status: json['status'] ?? '',
      coach: CoachMoreId.fromJson(json['data']['coach'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': {
        'coach': coach.toJson(),
      },
    };
  }
}
