class SignupModel {
  final String email;
  final String role;
  final String createdAt;
  final String id;

  SignupModel({
    required this.email,
    required this.role,
    required this.createdAt,
    required this.id,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
      email: json['email'],
      role: json['role'],
      createdAt: json['createdAt'],
      id: json['_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'role': role,
      'createdAt': createdAt,
      'id': id,
    };
  }
}
