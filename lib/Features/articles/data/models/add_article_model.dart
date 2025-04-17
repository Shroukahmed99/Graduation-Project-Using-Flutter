class AddArticleModel {
  final String id;
  final String title;
  final String content;
  final String? image;
  final String serviceProviderId;

  AddArticleModel({
    required this.id,
    required this.title,
    required this.content,
    required this.image,
    required this.serviceProviderId,
  });

  factory AddArticleModel.fromJson(Map<String, dynamic> json) {
    return AddArticleModel(
      id: json['_id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      content: json['content']?.toString() ?? '',
      image: (json['img'] == null || json['img'] == "null")
          ? null
          : json['img']?.toString(),
      serviceProviderId: json['serviceproviderId']?.toString() ?? '',
    );
  }
}

class ArticleResponse {
  final String status;
  final AddArticleModel article;

  ArticleResponse({
    required this.status,
    required this.article,
  });

  factory ArticleResponse.fromJson(Map<String, dynamic> json) {
    return ArticleResponse(
      status: json['status'],
      article: AddArticleModel.fromJson(json['data']['article']),
    );
  }
}
