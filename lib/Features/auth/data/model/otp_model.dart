class OtpModel {
  final String status;
  final String userId;

  OtpModel({required this.status, required this.userId});

  factory OtpModel.fromJson(Map<String, dynamic> json) {
    return OtpModel(
      status: json['status'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'userId': userId,
    };
  }
}
