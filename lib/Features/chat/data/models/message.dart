class MessageResponse {
  final String status;
  final int results;
  final List<Message> data;

  MessageResponse({
    required this.status,
    required this.results,
    required this.data,
  });

  factory MessageResponse.fromJson(Map<String, dynamic> json) {
    return MessageResponse(
      status: json['status'],
      results: json['results'],
      data: List<Message>.from(json['data'].map((x) => Message.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'results': results,
      'data': List<dynamic>.from(data.map((x) => x.toJson())),
    };
  }
}

class Message {
  // final String? id;
  final String bookingId;
  final String senderId;
  final String receiverId;
  final String senderType;
  final String text;
  // final DateTime? createdAt;
  // final int? v;

  Message({
    // this.id,
    required this.bookingId,
    required this.senderId,
    required this.receiverId,
    required this.senderType,
    required this.text,
    // this.createdAt,
    // this.v,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      // id: json['_id'],
      bookingId: json['bookingId'],
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      senderType: json['senderType'],
      text: json['text'],
      // createdAt: DateTime.parse(json['createdAt']),
      // v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // '_id': id,
      'bookingId': bookingId,
      'senderId': senderId,
      'receiverId': receiverId,
      'senderType': senderType,
      'text': text,
      // 'createdAt': createdAt!.toIso8601String(),
      // '__v': v,
    };
  }
}
