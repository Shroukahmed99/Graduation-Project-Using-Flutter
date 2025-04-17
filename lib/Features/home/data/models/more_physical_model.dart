class MorePhysical {
  final String id;
  final String email;
  final String role;
  final DateTime createdAt;

  const MorePhysical({
    required this.id,
    required this.email,
    required this.role,
    required this.createdAt,
  });

  factory MorePhysical.fromJson(Map<String, dynamic> json) {
    return MorePhysical(
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
  final int ratingQuantity;
  final List<dynamic> reviews;
  final String role;
  final String username;

  const PhysicalTherapistMore({
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

  factory PhysicalTherapistMore.fromJson(Map<String, dynamic> json) {
    return PhysicalTherapistMore(
      id: json['_id'] ?? '',
      user: MorePhysical.fromJson(json['userId'] ?? {}),
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

class PhysicalTherapyResponse {
  final String status;
  final PhysicalTherapistMore physicalTherapist;

  const PhysicalTherapyResponse({
    required this.status,
    required this.physicalTherapist,
  });

  factory PhysicalTherapyResponse.fromJson(Map<String, dynamic> json) {
    return PhysicalTherapyResponse(
      status: json['status'] ?? '',
      physicalTherapist:
          PhysicalTherapistMore.fromJson(json['data']['PhysicalTherapy'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': {
        'PhysicalTherapy': physicalTherapist.toJson(),
      },
    };
  }
}
