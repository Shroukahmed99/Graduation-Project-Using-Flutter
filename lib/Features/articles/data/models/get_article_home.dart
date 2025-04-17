class GetArticleHome {
  final String id;
  final String title;
  final String? image;
  final ServiceProvider serviceProvider;

  GetArticleHome({
    required this.id,
    required this.title,
    required this.image,
    required this.serviceProvider,
  });

  factory GetArticleHome.fromJson(Map<String, dynamic> json) {
    return GetArticleHome(
      id: json['_id'],
      title: json['title'],
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

class ArticleListResponse {
  final String status;
  final int results;
  final List<GetArticleHome> articles;

  ArticleListResponse({
    required this.status,
    required this.results,
    required this.articles,
  });

  factory ArticleListResponse.fromJson(Map<String, dynamic> json) {
    return ArticleListResponse(
      status: json['status'],
      results: json['results'],
      articles: List<GetArticleHome>.from(
        json['articles'].map((x) => GetArticleHome.fromJson(x)),
      ),
    );
  }
}
