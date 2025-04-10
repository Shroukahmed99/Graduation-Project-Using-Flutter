class MoreCoach {
  final String id;
  final String email;
  final String role;
  final DateTime createdAt;

  MoreCoach({
    required this.id,
    required this.email,
    required this.role,
    required this.createdAt,
  });

  factory MoreCoach.fromJson(Map<String, dynamic> json) {
    return MoreCoach(
      id: json['_id'],
      email: json['email'],
      role: json['role'],
      createdAt: DateTime.parse(json['createdAt']),
    );
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
  final String role;
  final String username;

  CoachMoreId({
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

  factory CoachMoreId.fromJson(Map<String, dynamic> json) {
    return CoachMoreId(
      id: json['_id'],
      user: MoreCoach.fromJson(json['userId']),
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

class CoachResponse {
  final String status;
  final CoachMoreId coach;

  CoachResponse({
    required this.status,
    required this.coach,
  });

  factory CoachResponse.fromJson(Map<String, dynamic> json) {
    return CoachResponse(
      status: json['status'],
      coach: CoachMoreId.fromJson(json['data']['coach']),
    );
  }
}
