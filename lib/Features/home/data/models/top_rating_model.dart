class TopProvidersResponse {
  final String status;
  final int results;
  final TopProvidersData data;

  TopProvidersResponse({
    required this.status,
    required this.results,
    required this.data,
  });

  factory TopProvidersResponse.fromJson(Map<String, dynamic> json) {
    return TopProvidersResponse(
      status: json['status'],
      results: json['results'],
      data: TopProvidersData.fromJson(json['data']),
    );
  }
}

class TopProvidersData {
  final List<TopProvider> topProviders;

  TopProvidersData({required this.topProviders});

  factory TopProvidersData.fromJson(Map<String, dynamic> json) {
    return TopProvidersData(
      topProviders: List<TopProvider>.from(
        json['topProviders'].map((x) => TopProvider.fromJson(x)),
      ),
    );
  }
}

class TopProvider {
  final String id;
  final String fullName;
  final String job;
  final int ratingQuantity;
  final double ratingAverage;

  TopProvider({
    required this.id,
    required this.fullName,
    required this.job,
    required this.ratingQuantity,
    required this.ratingAverage,
  });

  factory TopProvider.fromJson(Map<String, dynamic> json) {
    return TopProvider(
      id: json['_id'],
      fullName: json['fullName'],
      job: json['job'],
      ratingQuantity: json['ratingQuantity'],
      ratingAverage: (json['ratingAverage'] as num).toDouble(),
    );
  }
}
