class UsersModel {
  final String email;
  final String role;
  final String createdAt;
  final String id;
  final String token;

  UsersModel({
    required this.email,
    required this.role,
    required this.createdAt,
    required this.id,
    required this.token,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json, String extractedToken) {
    final userData = json['data']?['user'] ?? {};
    return UsersModel(
      email: userData['email'] ?? '',
      role: userData['role'] ?? '',
      createdAt: userData['createdAt'] ?? '',
      id: userData['_id'] ?? '',
      token: extractedToken, // 🔥 استخدم التوكن المستخرج من الكوكيز
    );
  }
}
