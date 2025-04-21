class GetProfileClientModel {
  final String status;
  final ClientModel? client;

  GetProfileClientModel({
    required this.status,
    required this.client,
  });

  factory GetProfileClientModel.fromJson(Map<String, dynamic> json) {
    return GetProfileClientModel(
      status: json['status'],
      client: ClientModel.fromJson(json['data']['client'][0]),  
    );
  }
}

class ClientModel {
  final String id;
  final UserModel user;
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

  ClientModel({
    required this.id,
    required this.user,
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

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      id: json['_id'],
      user: UserModel.fromJson(json['userId']),
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
      id: json['_id'],
      email: json['email'],
      role: json['role'],
      createdAt: json['createdAt'],
    );
  }
}
