class BookingResponse {
  final String status;
  final String message;
  final String systemMessage;

  BookingResponse({
    required this.status,
    required this.message,
    required this.systemMessage,
  });

  factory BookingResponse.fromJson(Map<String, dynamic> json) {
    return BookingResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      systemMessage: json['systemMessage'] as String,
    );
  }
}
