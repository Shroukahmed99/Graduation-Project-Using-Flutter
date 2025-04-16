class PasswordChangeResponseModel {
  final String status;
  final UserData data;

  PasswordChangeResponseModel({required this.status, required this.data});

  factory PasswordChangeResponseModel.fromJson(Map<String, dynamic> json) {
    return PasswordChangeResponseModel(
      status: json['status'],
      data: UserData.fromJson(json['data']),
    );
  }
}

class UserData {
  final User user;

  UserData({required this.user});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      user: User.fromJson(json['user']),
    );
  }
}

class User {
  final String id;
  final String email;
  final String role;
  final String createdAt;

  User({
    required this.id,
    required this.email,
    required this.role,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      email: json['email'],
      role: json['role'],
      createdAt: json['createdAt'],
    );
  }
}