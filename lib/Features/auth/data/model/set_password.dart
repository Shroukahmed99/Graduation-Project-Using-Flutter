class SetPassword {
  final String status;
  final String message;

  SetPassword({required this.status, required this.message});

  factory SetPassword.fromJson(Map<String, dynamic> json) {
    return SetPassword(
      status: json['status'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
    };
  }
}
