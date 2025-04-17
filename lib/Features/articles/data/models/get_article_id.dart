class ArticleResponse {
  final String status;
  final ArticleData data;

  ArticleResponse({required this.status, required this.data});

  factory ArticleResponse.fromJson(Map<String, dynamic> json) {
    return ArticleResponse(
      status: json['status'] ?? 'error',
      data: ArticleData.fromJson(json['data'] ?? {}),
    );
  }
}

class ArticleData {
  final GetArticleId article;

  ArticleData({required this.article});

  factory ArticleData.fromJson(Map<String, dynamic> json) {
    return ArticleData(
      article: GetArticleId.fromJson(json['article'] ?? {}),
    );
  }
}

class GetArticleId {
  final String? id;
  final String? title;
  final String? content;
  final String? img;
  final ServiceProvider? serviceProviderId;

  GetArticleId({
    this.id,
    this.title,
    this.content,
    this.img,
    this.serviceProviderId,
  });

  factory GetArticleId.fromJson(Map<String, dynamic> json) {
    return GetArticleId(
      id: json['_id']?.toString(),
      title: json['title'],
      content: json['content'],
      img: json['img'],
      serviceProviderId: json['serviceproviderId'] != null
          ? ServiceProvider.fromJson(json['serviceproviderId'])
          : null,
    );
  }
}

class ServiceProvider {
  final String? id;
  final String? userId;
  final String? fullName;
  final String? serviceProviderId;

  ServiceProvider({
    this.id,
    this.userId,
    this.fullName,
    this.serviceProviderId,
  });

  factory ServiceProvider.fromJson(Map<String, dynamic> json) {
    return ServiceProvider(
      id: json['_id']?.toString(),
      userId: json['userId']?.toString(),
      fullName: json['fullName'],
      serviceProviderId: json['id']?.toString(),
    );
  }
}
