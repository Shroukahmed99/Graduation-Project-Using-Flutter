class GetProfileProviderModel {
  final String status;
  final ProviderProfile serviceProvider;

  GetProfileProviderModel({
    required this.status,
    required this.serviceProvider,
  });

  factory GetProfileProviderModel.fromJson(Map<String, dynamic> json) {
    return GetProfileProviderModel(
      status: json['status'],
      serviceProvider: ProviderProfile.fromJson(json['data']['serviceProvider'][0]),  // فقط المزود الأول
    );
  }
}

class ProviderProfile {
  final String id;
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
  final UserId userId;

  ProviderProfile({
    required this.id,
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
    required this.userId,
  });

  factory ProviderProfile.fromJson(Map<String, dynamic> json) {
    return ProviderProfile(
      id: json['_id'],
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
      userId: UserId.fromJson(json['userId']),
    );
  }
}

class UserId {
  final String id;
  final String email;
  final String role;
  final String createdAt;

  UserId({
    required this.id,
    required this.email,
    required this.role,
    required this.createdAt,
  });

  factory UserId.fromJson(Map<String, dynamic> json) {
    return UserId(
      id: json['_id'],
      email: json['email'],
      role: json['role'],
      createdAt: json['createdAt'],
    );
  }
}

// class GetProfileProviderModel {
//   final String status;
//   final GetProviderData data;

//   GetProfileProviderModel({
//     required this.status,
//     required this.data,
//   });

//   factory GetProfileProviderModel.fromJson(Map<String, dynamic> json) {
//     return GetProfileProviderModel(
//       status: json['status'],
//       data: GetProviderData.fromJson(json['data']),
//     );
//   }
// }

// class GetProviderData {
//   final List<ProviderProfile> serviceProvider;

//   GetProviderData({required this.serviceProvider});

//   factory GetProviderData.fromJson(Map<String, dynamic> json) {
//     return GetProviderData(
//       serviceProvider: List<ProviderProfile>.from(
//         json['serviceProvider'].map((x) => ProviderProfile.fromJson(x)),
//       ),
//     );
//   }
// }

// class ProviderProfile {
//   final String id;
//   final UserId userId;
//   final String fullName;
//   final String mobileNumber;
//   final String job;
//   final String gender;
//   final String age;
//   final String yearsOfExperience;
//   final String jobTitle;
//   final String bio;
//   final String identifier;
//   final int priceRange;
//   final String role;
//   final String username;

//   ProviderProfile({
//     required this.id,
//     required this.userId,
//     required this.fullName,
//     required this.mobileNumber,
//     required this.job,
//     required this.gender,
//     required this.age,
//     required this.yearsOfExperience,
//     required this.jobTitle,
//     required this.bio,
//     required this.identifier,
//     required this.priceRange,
//     required this.role,
//     required this.username,
//   });

//   factory ProviderProfile.fromJson(Map<String, dynamic> json) {
//     return ProviderProfile(
//       id: json['_id'],
//       userId: UserId.fromJson(json['userId']),
//       fullName: json['fullName'],
//       mobileNumber: json['mobileNumber'],
//       job: json['job'],
//       gender: json['gender'],
//       age: json['age'],
//       yearsOfExperience: json['yearsOfExperience'],
//       jobTitle: json['jobTitle'],
//       bio: json['bio'],
//       identifier: json['identifier'],
//       priceRange: json['priceRange'],
//       role: json['role'],
//       username: json['username'],
//     );
//   }
// }

// class UserId {
//   final String id;
//   final String email;
//   final String role;
//   final String createdAt;

//   UserId({
//     required this.id,
//     required this.email,
//     required this.role,
//     required this.createdAt,
//   });

//   factory UserId.fromJson(Map<String, dynamic> json) {
//     return UserId(
//       id: json['_id'],
//       email: json['email'],
//       role: json['role'],
//       createdAt: json['createdAt'],
//     );
//   }
// }
