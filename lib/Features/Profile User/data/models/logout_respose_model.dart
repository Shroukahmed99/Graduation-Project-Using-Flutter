class LogoutResponseModel {
  final String status;

  LogoutResponseModel({required this.status});

  factory LogoutResponseModel.fromJson(Map<String, dynamic> json) {
    return LogoutResponseModel(
      status: json['status'] ?? '',
    );
  }

  bool get isSuccess => status == 'success';
}