import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket socket;
  bool _isConnected = false; // ✅ فلاغ لمنع الاتصال المتكرر

  void connect(String bookingId) {
    if (_isConnected) return; // ✅ لو متصل خلاص ما تتصلش تاني
    _isConnected = true;

    socket = IO.io(
      'https://graduation-project-production-e386.up.railway.app',
      <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
      },
    );

    socket.connect();

    socket.onConnect((_) {
      print('🔌 Socket connected');
      socket.emit('joinRoom', bookingId);
      print('Joined room: $bookingId');
    });

    socket.onDisconnect((_) {
      print('❌ Socket disconnected');
    });
  }

  void sendMessage(Map<String, dynamic> message) {
    print('Sending message: $message');
    socket.emit('sendMessage', message);
  }

  void onMessage(Function(Map<String, dynamic>) callback) {
    socket.off('receiveMessage'); // ✅ مهم جداً
    socket.on('receiveMessage', (data) {
      print('Received message in onMessage: $data');
      callback(data);
    });
  }

  void dispose() {
    socket.disconnect();
    _isConnected = false;
    print('Socket disconnected');
  }
}
