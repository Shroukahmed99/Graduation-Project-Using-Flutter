class GetAllArticleModel {
  final String id;
  final String title;
  final String content;
  final String? image;
  final ServiceProvider serviceProvider;

  GetAllArticleModel({
    required this.id,
    required this.title,
    required this.content,
    required this.image,
    required this.serviceProvider,
  });

  factory GetAllArticleModel.fromJson(Map<String, dynamic> json) {
    return GetAllArticleModel(
      id: json['_id'],
      title: json['title'],
      content: json['content'],
      image: json['img'] == "null" ? null : json['img'],
      serviceProvider: ServiceProvider.fromJson(json['serviceproviderId']),
    );
  }
}

class ServiceProvider {
  final String id;
  final String userId;
  final String fullName;

  ServiceProvider({
    required this.id,
    required this.userId,
    required this.fullName,
  });

  factory ServiceProvider.fromJson(Map<String, dynamic> json) {
    return ServiceProvider(
      id: json['_id'],
      userId: json['userId'],
      fullName: json['fullName'],
    );
  }
}

class ArticlesResponse {
  final String status;
  final int results;
  final List<GetAllArticleModel> articles;

  ArticlesResponse({
    required this.status,
    required this.results,
    required this.articles,
  });

  factory ArticlesResponse.fromJson(Map<String, dynamic> json) {
    return ArticlesResponse(
      status: json['status'],
      results: json['results'],
      articles: List<GetAllArticleModel>.from(
        json['articles']
            .map((articleJson) => GetAllArticleModel.fromJson(articleJson)),
      ),
    );
  }
}
