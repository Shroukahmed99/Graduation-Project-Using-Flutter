// client_response_model.dart
import 'package:sehatak/Features/Profile%20User/data/models/client_model.dart';

class ClientResponseModel {
  final String status;
  final ClientData data;

  ClientResponseModel({
    required this.status,
    required this.data,
  });

  factory ClientResponseModel.fromJson(Map<String, dynamic> json) {
    return ClientResponseModel(
      status: json['status'],
      data: ClientData.fromJson(json['data']),
    );
  }
}

class ClientData {
  final List<ClientModel> client;

  ClientData({required this.client});

  factory ClientData.fromJson(Map<String, dynamic> json) {
    List<dynamic> clientList = json['client'];
    List<ClientModel> clients = clientList.map((client) => ClientModel.fromJson(client)).toList();
    
    return ClientData(client: clients);
  }
}