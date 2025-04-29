class AddCommentResponse {
  final String status;
  final String message;
  final CommentData data;

  AddCommentResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AddCommentResponse.fromJson(Map<String, dynamic> json) {
    return AddCommentResponse(
      status: json['status'],
      message: json['message'],
      data: CommentData.fromJson(json['data']),
    );
  }
}

class CommentData {
  final Comment comment;

  CommentData({
    required this.comment,
  });

  factory CommentData.fromJson(Map<String, dynamic> json) {
    return CommentData(
      comment: Comment.fromJson(json['comment']),
    );
  }
}

class Comment {
  final String content;
  final String postId;
  final String userId;
  final String userType;
  final String fullName;
  final String id;
  final DateTime createdAt;

  Comment({
    required this.content,
    required this.postId,
    required this.userId,
    required this.userType,
    required this.fullName,
    required this.id,
    required this.createdAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      content: json['content'],
      postId: json['postId'],
      userId: json['userId'],
      userType: json['userType'],
      fullName: json['fullName'],
      id: json['_id'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
