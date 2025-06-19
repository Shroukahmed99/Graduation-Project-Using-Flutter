import 'package:sehatak/core/utils/api_service.dart';
import 'chat_bot_repo.dart';

class ChatBotRepoImpl extends ChatBotRepo {
  final ApiService apiService;

  ChatBotRepoImpl(this.apiService);

  @override
  Future<String> sendMessageToBot(String message) async {
    final response = await apiService.post(
      endpoint: 'chatbot/chatWithGemini',
      data: {'message': message},
    );
    return response['reply'] ?? 'لا يوجد رد.';
  }
}