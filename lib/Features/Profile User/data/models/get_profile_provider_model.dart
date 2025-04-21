class GetProfileProviderModel {
  final String status;
  final ProviderModel? provider;

  GetProfileProviderModel({
    required this.status,
    required this.provider,
  });

  factory GetProfileProviderModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null && 
        json['data']['serviceProvider'] != null && 
        json['data']['serviceProvider'].isNotEmpty) {
      return GetProfileProviderModel(
        status: json['status'],
        provider: ProviderModel.fromJson(json['data']['serviceProvider'][0]),
      );
    } else {
      return GetProfileProviderModel(
        status: json['status'],
        provider: null,
      );
    }
  }
}

class ProviderModel {
  final String id;
  final UserModel user;
  final String fullName;
  final String mobileNumber;
  final String gender;
  final String age;
  final String job;
  final String yearsOfExperience;
  final String jobTitle;
  final String bio;
  final String identifier;
  final int priceRange;
  final String role;
  final String username;

  ProviderModel({
    required this.id,
    required this.user,
    required this.fullName,
    required this.mobileNumber,
    required this.gender,
    required this.age,
    required this.job,
    required this.yearsOfExperience,
    required this.jobTitle,
    required this.bio,
    required this.identifier,
    required this.priceRange,
    required this.role,
    required this.username,
  });

  factory ProviderModel.fromJson(Map<String, dynamic> json) {
    return ProviderModel(
      id: json['_id'] ?? '',
      user: UserModel.fromJson(json['userId'] ?? {}),
      fullName: json['fullName'] ?? '',
      mobileNumber: json['mobileNumber'] ?? '',
      gender: json['gender'] ?? '',
      age: json['age']?.toString() ?? '',
      job: json['job'] ?? '',
      yearsOfExperience: json['yearsOfExperience']?.toString() ?? '',
      jobTitle: json['jobTitle'] ?? '',
      bio: json['bio'] ?? '',
      identifier: json['identifier'] ?? '',
      priceRange: json['priceRange'] ?? 0,
      role: json['role'] ?? '',
      username: json['username'] ?? '',
    );
  }
}

class UserModel {
  final String id;
  final String email;
  final String role;
  final String createdAt;

  UserModel({
    required this.id,
    required this.email,
    required this.role,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] ?? '',
      createdAt: json['createdAt'] ?? '',
    );
  }
}