class ReviewModel {
  final String id;
  final String comment;
  final double rating;
  final String serviceProviderId;
  final String clientName;
  final String clientId;

  ReviewModel({
    required this.id,
    required this.comment,
    required this.rating,
    required this.serviceProviderId,
    required this.clientName,
    required this.clientId,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['_id'],
      comment: json['comment'],
      rating: json['rating'].toDouble(),
      serviceProviderId: json['serviceprovider'],
      clientName: json['Client']['fullName'],
      clientId: json['Client']['_id'],
    );
  }
}
