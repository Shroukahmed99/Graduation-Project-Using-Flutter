class CommunityListResponse {
  final String status;
  final int results;
  final CommunityListData data;

  CommunityListResponse({
    required this.status,
    required this.results,
    required this.data,
  });

  factory CommunityListResponse.fromJson(Map<String, dynamic> json) {
    return CommunityListResponse(
      status: json['status'],
      results: json['results'],
      data: CommunityListData.fromJson(json['data']),
    );
  }
}

class CommunityListData {
  final List<Community> communities;

  CommunityListData({
    required this.communities,
  });

  factory CommunityListData.fromJson(Map<String, dynamic> json) {
    return CommunityListData(
      communities: List<Community>.from(
        json['communities'].map((x) => Community.fromJson(x)),
      ),
    );
  }
}

class Community {
  final String id;
  final String content;
  final String? img;
  final Client clientId;
  final int likesCount;
  final int commentCount;
  final DateTime createdAt;
  final DateTime updatedAt;

  Community({
    required this.id,
    required this.content,
    this.img,
    required this.clientId,
    required this.likesCount,
    required this.commentCount,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Community.fromJson(Map<String, dynamic> json) {
    return Community(
      id: json['_id'],
      content: json['content'],
      img: json['img'],
      clientId: Client.fromJson(json['clientId']),
      likesCount: json['likesCount'],
      commentCount: json['commentCount'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

class Client {
  final String id;
  final String userId;
  final String fullName;

  Client({
    required this.id,
    required this.userId,
    required this.fullName,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['_id'],
      userId: json['userId'],
      fullName: json['fullName'],
    );
  }
}
