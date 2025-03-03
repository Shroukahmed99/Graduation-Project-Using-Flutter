class LoginModel {
  final String email;
  final String role;
  final String createdAt;
  final String id;
  final String token;

  LoginModel({
    required this.email,
    required this.role,
    required this.createdAt,
    required this.id,
    required this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json, String token) {
    return LoginModel(
      email: json['user']['email'] ?? '',
      role: json['user']['role'] ?? '',
      createdAt: json['user']['createdAt'] ?? '',
      id: json['user']['_id'] ?? '',
      token: token, 
    );
  }
}

class SignUpModel {
  String? status;
  Data? data;

  SignUpModel({this.status, this.data});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;

  Data({this.user});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? email;
  String? role;
  String? createdAt;
  String? sId;
  int? iV;

  User({this.email, this.role, this.createdAt, this.sId, this.iV});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    role = json['role'];
    createdAt = json['createdAt'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['role'] = this.role;
    data['createdAt'] = this.createdAt;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
