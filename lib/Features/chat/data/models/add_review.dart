class ReviewModel {
  final String status;
  final ReviewData data;

  ReviewModel({
    required this.status,
    required this.data,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      status: json['status'],
      data: ReviewData.fromJson(json['data']),
    );
  }
}

class ReviewData {
  final Review review;

  ReviewData({
    required this.review,
  });

  factory ReviewData.fromJson(Map<String, dynamic> json) {
    return ReviewData(
      review: Review.fromJson(json['review']),
    );
  }
}

class Review {
  final String comment;
  final int rating;
  final String serviceProvider;
  final String client;
  final String id;

  Review({
    required this.comment,
    required this.rating,
    required this.serviceProvider,
    required this.client,
    required this.id,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      comment: json['comment'],
      rating: json['rating'],
      serviceProvider: json['serviceprovider'],
      client: json['Client'],
      id: json['_id'],
    );
  }
}
