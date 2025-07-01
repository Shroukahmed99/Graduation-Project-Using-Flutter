class BookingResponse {
  final String status;
  final int results;
  final List<BookingData> data;

  BookingResponse({
    required this.status,
    required this.results,
    required this.data,
  });

  factory BookingResponse.fromJson(Map<String, dynamic> json) {
    return BookingResponse(
      status: json['status'],
      results: json['results'],
      data: List<BookingData>.from(
          json['data'].map((x) => BookingData.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "results": results,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class BookingData {
  final String id;
  final String client;
  final ServiceProvider serviceProvider;
  final String goal;
  final int duration;
  final int totalPrice;
  final int platformFee;
  final int servicerProviderIncome;
  final bool isPaid;
  final DateTime paidAt;
  final String status;
  final String paymentIntentId;

  BookingData({
    required this.id,
    required this.client,
    required this.serviceProvider,
    required this.goal,
    required this.duration,
    required this.totalPrice,
    required this.platformFee,
    required this.servicerProviderIncome,
    required this.isPaid,
    required this.paidAt,
    required this.status,
    required this.paymentIntentId,
  });

  factory BookingData.fromJson(Map<String, dynamic> json) => BookingData(
        id: json['_id'],
        client: json['client'],
        serviceProvider: ServiceProvider.fromJson(json['serviceProvider']),
        goal: json['goal'],
        duration: (json['duration'] as num).toInt(),
        totalPrice: (json['totalPrice'] as num).toInt(),
        platformFee: (json['platformFee'] as num).toInt(),
        servicerProviderIncome: (json['servicerProviderIncome'] as num).toInt(),
        isPaid: json['isPaid'],
        paidAt: DateTime.parse(json['paidAt']),
        status: json['status'],
        paymentIntentId: json['paymentIntentId'],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "client": client,
        "serviceProvider": serviceProvider.toJson(),
        "goal": goal,
        "duration": duration,
        "totalPrice": totalPrice,
        "platformFee": platformFee,
        "servicerProviderIncome": servicerProviderIncome,
        "isPaid": isPaid,
        "paidAt": paidAt.toIso8601String(),
        "status": status,
        "paymentIntentId": paymentIntentId,
      };
}

class ServiceProvider {
  final String id;
  final String userId;
  final String fullName;
  final String jobTitle;

  ServiceProvider({
    required this.id,
    required this.userId,
    required this.fullName,
    required this.jobTitle,
  });

  factory ServiceProvider.fromJson(Map<String, dynamic> json) =>
      ServiceProvider(
        id: json['_id'],
        userId: json['userId'],
        fullName: json['fullName'],
        jobTitle: json['jobTitle'],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "fullName": fullName,
        "jobTitle": jobTitle,
      };
}
