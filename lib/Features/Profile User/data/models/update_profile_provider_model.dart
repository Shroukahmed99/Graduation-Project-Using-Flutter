class UpdateProfileProviderModel {
  final String status;
  final UpdatedProviderData data;

  UpdateProfileProviderModel({
    required this.status,
    required this.data,
  });

  factory UpdateProfileProviderModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileProviderModel(
      status: json['status'],
      data: UpdatedProviderData.fromJson(json['data']),
    );
  }
}

class UpdatedProviderData {
  final UpdatedProvider updatedProvider;

  UpdatedProviderData({required this.updatedProvider});

  factory UpdatedProviderData.fromJson(Map<String, dynamic> json) {
    if (json['updatedServiceProvider'] != null) {
      return UpdatedProviderData(
        updatedProvider: UpdatedProvider.fromJson(json['updatedServiceProvider']),
      );
    } else {
      throw Exception('بيانات updatedServiceProvider غير موجودة في الاستجابة');
    }
  }
}

class UpdatedProvider {
  final String id;
  final String userId;
  final String fullName;
  final String mobileNumber;
  final String age;
  final String job;
  final String jobTitle;
  final String bio;
  final String identifier;
  final int priceRange;
  final String yearsOfExperience;
  final String role;
  final String username;


  UpdatedProvider({
    required this.id,
    required this.userId,
    required this.fullName,
    required this.mobileNumber,
    required this.age,
    required this.job,
    required this.jobTitle,
    required this.bio,
    required this.identifier,
    required this.priceRange,
    required this.yearsOfExperience,
    required this.role,
    required this.username,
   
  });

  factory UpdatedProvider.fromJson(Map<String, dynamic> json) {
    return UpdatedProvider(
      id: json['_id'] ?? '',
      userId: json['userId'] ?? '',
      fullName: json['fullName'] ?? '',
      mobileNumber: json['mobileNumber'] ?? '',
      age: json['age']?.toString() ?? '',
      job: json['job'] ?? '',
      jobTitle: json['jobTitle'] ?? '',
      bio: json['bio'] ?? '',
      identifier: json['identifier'] ?? '',
      priceRange: json['priceRange'] ?? 0,
      yearsOfExperience: json['yearsOfExperience']?.toString() ?? '',
      role: json['role'] ?? '',
      username: json['username'] ?? '',
      
    );
  }
}
