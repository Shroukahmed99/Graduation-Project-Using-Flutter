
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
      id: json['_id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      content: json['content']?.toString() ?? '',
      image: json['img'] == "null" ? null : json['img']?.toString(),
      serviceProvider: json['serviceproviderId'] != null
          ? ServiceProvider.fromJson(json['serviceproviderId'])
          : ServiceProvider(id: '', userId: '', fullName: ''),
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
      id: json['_id']?.toString() ?? '',
      userId: json['userId']?.toString() ?? '',
      fullName: json['fullName']?.toString() ?? '',
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
      status: json['status']?.toString() ?? '',
      results: json['results'] ?? 0,
      articles: List<GetAllArticleModel>.from(
        (json['articles'] as List)
            .map((articleJson) => GetAllArticleModel.fromJson(articleJson)),
      ),
    );
  }
}
