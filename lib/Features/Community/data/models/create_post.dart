class CommunityResponse {
  final String status;
  final CommunityData data;

  CommunityResponse({required this.status, required this.data});

  factory CommunityResponse.fromJson(Map<String, dynamic> json) {
    return CommunityResponse(
      status: json['status'],
      data: CommunityData.fromJson(json['data']),
    );
  }
}

class CommunityData {
  final NewCommunity newCommunity;

  CommunityData({required this.newCommunity});

  factory CommunityData.fromJson(Map<String, dynamic> json) {
    return CommunityData(
      newCommunity: NewCommunity.fromJson(json['newCommunity']),
    );
  }
}

class NewCommunity {
  final String content;
  final String? img;
  final String clientId;
  final int likesCount;
  final int commentCount;
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;

  NewCommunity({
    required this.content,
    this.img,
    required this.clientId,
    required this.likesCount,
    required this.commentCount,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NewCommunity.fromJson(Map<String, dynamic> json) {
    return NewCommunity(
      content: json['content'],
      img: json['img'],
      clientId: json['clientId'],
      likesCount: json['likesCount'],
      commentCount: json['commentCount'],
      id: json['_id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
