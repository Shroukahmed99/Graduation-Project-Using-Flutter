class ClientDataResponse {
  final String status;
  final int results;
  final List<ClientData> data;

  ClientDataResponse({
    required this.status,
    required this.results,
    required this.data,
  });

  factory ClientDataResponse.fromJson(Map<String, dynamic> json) {
    return ClientDataResponse(
      status: json['status'] as String,
      results: json['results'] as int,
      data: (json['data'] as List)
          .map((item) => ClientData.fromJson(item))
          .toList(),
    );
  }
}

class ClientData {
  final String id;
  final Client client;
  final String goal;
  final int duration;
  final int totalPrice;

  ClientData({
    required this.id,
    required this.client,
    required this.goal,
    required this.duration,
    required this.totalPrice,
  });

  factory ClientData.fromJson(Map<String, dynamic> json) {
    return ClientData(
      id: json['_id'] as String,
      client: Client.fromJson(json['client']),
      goal: json['goal'] as String,
      duration: json['duration'] as int,
      totalPrice: json['totalPrice'] as int,
    );
  }
}

class Client {
  final String id;
  final String userId;
  final String fullName;
  final String age;
  final String weight;
  final String height;

  Client({
    required this.id,
    required this.userId,
    required this.fullName,
    required this.age,
    required this.weight,
    required this.height,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['_id'] as String,
      userId: json['userId'] as String,
      fullName: json['fullName'] as String,
      age: json['age'] as String,
      weight: json['weight'] as String,
      height: json['height'] as String,
    );
  }
}
