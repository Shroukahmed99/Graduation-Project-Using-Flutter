import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket socket;

  void connect(String bookingId) {
    socket = IO.io(
      'https://graduation-project-production-e386.up.railway.app', // ✅ رابط السيرفر فقط
      <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
      },
    );

    socket.connect();

    socket.onConnect((_) {
      print('🔌 Socket connected'); // برنت للتأكد من الاتصال
      socket.emit('joinRoom', bookingId); // ✅ انضمام للروم الصحيح
      print('Joined room: $bookingId'); // برنت عند الانضمام للروم
    });

    socket.onDisconnect((_) {
      print('❌ Socket disconnected');
    });
  }

  void sendMessage(Map<String, dynamic> message) {
    print('Sending message: $message'); // برنت عند إرسال الرسالة
    socket.emit('sendMessage', message); // ✅ نفس الاسم في السيرفر
  }

  void onMessage(Function(Map<String, dynamic>) callback) {
    socket.on('receiveMessage', (data) {
      print('Received message in onMessage: $data');
      callback(data);
    });
  }

  void dispose() {
    socket.disconnect(); // ✅ استخدام disconnect بدل dispose
    print('Socket disconnected');
  }
}
