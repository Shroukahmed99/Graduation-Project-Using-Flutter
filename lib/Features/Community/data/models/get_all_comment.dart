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
  final List<CommentAll> comments;

  CommentListData({
    required this.comments,
  });

  factory CommentListData.fromJson(Map<String, dynamic> json) {
    return CommentListData(
      comments: List<CommentAll>.from(
        json['comments'].map((x) => CommentAll.fromJson(x)),
      ),
    );
  }
}

class CommentAll {
  final String id;
  final String content;
  final String postId;
  final String userId;
  final String userType;
  final String fullName;
  final DateTime createdAt;

  CommentAll({
    required this.id,
    required this.content,
    required this.postId,
    required this.userId,
    required this.userType,
    required this.fullName,
    required this.createdAt,
  });

  factory CommentAll.fromJson(Map<String, dynamic> json) {
    return CommentAll(
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
