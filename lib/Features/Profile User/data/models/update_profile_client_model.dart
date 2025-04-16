// update_profile_client_model.dart

class UpdateProfileClientModel {
  final String status;
  final UpdatedClientData data;

  UpdateProfileClientModel({
    required this.status,
    required this.data,
  });

  factory UpdateProfileClientModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileClientModel(
      status: json['status'],
      data: UpdatedClientData.fromJson(json['data']),
    );
  }
}

class UpdatedClientData {
  final UpdatedClient updatedClient;

  UpdatedClientData({required this.updatedClient});

  factory UpdatedClientData.fromJson(Map<String, dynamic> json) {
    return UpdatedClientData(
      updatedClient: UpdatedClient.fromJson(json['updatedClient']),
    );
  }
}

class UpdatedClient {
  final String id;
  final String userId;
  final String fullName;
  final String mobileNumber;
  final String gender;
  final String age;
  final String weight;
  final String height;
  final String goal;
  final String physicalActivityLevel;
  final String role;
  final String username;

  UpdatedClient({
    required this.id,
    required this.userId,
    required this.fullName,
    required this.mobileNumber,
    required this.gender,
    required this.age,
    required this.weight,
    required this.height,
    required this.goal,
    required this.physicalActivityLevel,
    required this.role,
    required this.username,
  });

  factory UpdatedClient.fromJson(Map<String, dynamic> json) {
    return UpdatedClient(
      id: json['_id'],
      userId: json['userId'],
      fullName: json['fullName'],
      mobileNumber: json['mobileNumber'],
      gender: json['gender'],
      age: json['age'],
      weight: json['weight'],
      height: json['height'],
      goal: json['goal'],
      physicalActivityLevel: json['physicalActivityLevel'],
      role: json['role'],
      username: json['username'],
    );
  }
}
