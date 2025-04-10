class MorePhysical {
  final String id;
  final String email;
  final String role;
  final DateTime createdAt;

  MorePhysical({
    required this.id,
    required this.email,
    required this.role,
    required this.createdAt,
  });

  factory MorePhysical.fromJson(Map<String, dynamic> json) {
    return MorePhysical(
      id: json['_id'],
      email: json['email'],
      role: json['role'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}

class PhysicalTherapistMore {
  final String id;
  final MorePhysical user;
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

  PhysicalTherapistMore({
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

  factory PhysicalTherapistMore.fromJson(Map<String, dynamic> json) {
    return PhysicalTherapistMore(
      id: json['_id'],
      user: MorePhysical.fromJson(json['userId']),
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

class PhysicalTherapyResponse {
  final String status;
  final PhysicalTherapistMore physicalTherapist;

  PhysicalTherapyResponse({
    required this.status,
    required this.physicalTherapist,
  });

  factory PhysicalTherapyResponse.fromJson(Map<String, dynamic> json) {
    return PhysicalTherapyResponse(
      status: json['status'],
      physicalTherapist:
          PhysicalTherapistMore.fromJson(json['data']['PhysicalTherapy']),
    );
  }
}
