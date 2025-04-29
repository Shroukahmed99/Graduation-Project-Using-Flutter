class LikePostResponse {
  final String status;
  final bool liked;
  final String message;
  final int likesCount;

  LikePostResponse({
    required this.status,
    required this.liked,
    required this.message,
    required this.likesCount,
  });

  factory LikePostResponse.fromJson(Map<String, dynamic> json) {
    return LikePostResponse(
      status: json['status'],
      liked: json['liked'],
      message: json['message'],
      likesCount: json['likesCount'],
    );
  }
}
