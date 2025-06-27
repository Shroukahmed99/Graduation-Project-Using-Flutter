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
      id: json['_id']?.toString() ?? '',
      title: json['title'] ?? '',
      image: json['img'] == "null" ? null : json['img'],
      serviceProvider: ServiceProvider.fromJson(json['serviceproviderId'] ?? {}),
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
    final articlesJson = json['articles'];

    if (articlesJson == null || articlesJson is! List) {
      throw Exception("Invalid or missing 'articles' field");
    }

    return ArticleListResponse(
      status: json['status'] ?? 'error',
      results: json['results'] ?? 0,
      articles: List<GetArticleHome>.from(
        articlesJson.map((e) {
          if (e == null || e is! Map) {
            throw Exception("Each article must be a JSON object");
          }
          return GetArticleHome.fromJson(e as Map<String, dynamic>);
        }),
      ),
    );
  }
}
