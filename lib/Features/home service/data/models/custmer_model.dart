class NewCustomerResponse {
  final String status;
  final int results;
  final List<PaymentData> data;

  NewCustomerResponse({
    required this.status,
    required this.results,
    required this.data,
  });

  factory NewCustomerResponse.fromJson(Map<String, dynamic> json) {
    return NewCustomerResponse(
      status: json['status'] as String,
      results: json['results'] as int,
      data: (json['data'] as List<dynamic>)
          .map((item) => PaymentData.fromJson(item))
          .toList(),
    );
  }
}

class PaymentData {
  final String id;
  final Client client;
  final String serviceProvider;
  final String goal;
  final int duration;
  final int totalPrice;
  final int platformFee;
  final int servicerProviderIncome;
  final bool isPaid;
  final DateTime paidAt;
  final String status;
  final String paymentIntentId;
  final int v;

  PaymentData({
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
    required this.v,
  });

  factory PaymentData.fromJson(Map<String, dynamic> json) {
    return PaymentData(
      id: json['_id'] as String,
      client: Client.fromJson(json['client']),
      serviceProvider: json['serviceProvider'] as String,
      goal: json['goal'] as String,
      duration: (json['duration'] as num).toInt(),
      totalPrice: (json['totalPrice'] as num).toInt(),
      platformFee: (json['platformFee'] as num).toInt(),
      servicerProviderIncome: (json['servicerProviderIncome'] as num).toInt(),
      isPaid: json['isPaid'] as bool,
      paidAt: DateTime.parse(json['paidAt'] as String),
      status: json['status'] as String,
      paymentIntentId: json['paymentIntentId'] as String,
      v: (json['__v'] as num).toInt(),
    );
  }
}

class Client {
  final String id;
  final String userId;
  final String fullName;

  Client({
    required this.id,
    required this.userId,
    required this.fullName,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['_id'] as String,
      userId: json['userId'] as String,
      fullName: json['fullName'] as String,
    );
  }
}
