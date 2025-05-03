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
  final String bookingId;
  final String senderId;
  final String receiverId;
  final String senderType;
  final String text;

  Message({
    required this.bookingId,
    required this.senderId,
    required this.receiverId,
    required this.senderType,
    required this.text,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      bookingId: json['bookingId'],
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      senderType: json['senderType'],
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bookingId': bookingId,
      'senderId': senderId,
      'receiverId': receiverId,
      'senderType': senderType,
      'text': text,
    };
  }
}
