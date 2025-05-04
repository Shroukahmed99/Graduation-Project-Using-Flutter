import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket socket;
  bool _isConnected = false;

  void connect(String bookingId) {
    if (_isConnected) return;
    _isConnected = true;

    socket = IO.io(
      'https://graduation-project-production-e386.up.railway.app',
      <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
      },
    );

    socket.onConnect((_) {
      socket.emit('joinRoom', bookingId);
    });

    socket.onDisconnect((_) {});

    socket.onConnectError((data) {});

    socket.onError((data) {});

    socket.connect();
  }

  void sendMessage(Map<String, dynamic> message) {
    socket.emit('sendMessage', message);
  }

  void onMessage(Function(Map<String, dynamic>) callback) {
    socket.off('receiveMessage');
    socket.on('receiveMessage', (data) {
      try {
        callback(data);
      } catch (_) {}
    });
  }

  void dispose() {
    if (_isConnected) {
      socket.disconnect();
      _isConnected = false;
    }
  }
}
