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

  factory UsersModel.fromJson(Map<String, dynamic> json, {String? token}) {
    final userData = json['data'] != null ? json['data']!['user'] : null; 

    return UsersModel(
      email: userData?['email'] ?? '',
      role: userData?['role'] ?? '',
      createdAt: userData?['createdAt'] ?? '',
      id: userData?['_id'] ?? '',
      token: token ?? '',
    );
  }
}


// class UsersModel {
//   final String email;
//   final String role;
//   final String createdAt;
//   final String id;
//   final String token;

//   UsersModel({
//     required this.email,
//     required this.role,
//     required this.createdAt,
//     required this.id,
//     required this.token,
//   });

//   factory UsersModel.fromJson(Map<String, dynamic> json, {String? token}) {
//     return UsersModel(
//       email: json['user']['email'] ?? '',
//       role: json['user']['role'] ?? '',
//       createdAt: json['user']['createdAt'] ?? '',
//       id: json['user']['_id'] ?? '',
//       token: token ?? '',
//     );
//   }
// }
