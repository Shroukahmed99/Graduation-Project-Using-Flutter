class CommentListResponse {
  final String status;
  final int results;
  final CommentListData data;

  CommentListResponse({
    required this.status,
    required this.results,
    required this.data,
  });

  factory CommentListResponse.fromJson(Map<String, dynamic> json) {
    return CommentListResponse(
      status: json['status'],
      results: json['results'],
      data: CommentListData.fromJson(json['data']),
    );
  }
}

class CommentListData {
  final List<Comment> comments;

  CommentListData({
    required this.comments,
  });

  factory CommentListData.fromJson(Map<String, dynamic> json) {
    return CommentListData(
      comments: List<Comment>.from(
        json['comments'].map((x) => Comment.fromJson(x)),
      ),
    );
  }
}

class Comment {
  final String id;
  final String content;
  final String postId;
  final String userId;
  final String userType;
  final String fullName;
  final DateTime createdAt;

  Comment({
    required this.id,
    required this.content,
    required this.postId,
    required this.userId,
    required this.userType,
    required this.fullName,
    required this.createdAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['_id'],
      content: json['content'],
      postId: json['postId'],
      userId: json['userId'],
      userType: json['userType'],
      fullName: json['fullName'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
