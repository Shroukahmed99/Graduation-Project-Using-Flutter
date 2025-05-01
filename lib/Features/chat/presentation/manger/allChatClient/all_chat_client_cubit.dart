import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sehatak/Features/chat/data/models/all_chat.dart';
import 'package:sehatak/Features/chat/data/repo/chat_repo.dart';

part 'all_chat_client_state.dart';

class AllChatClientCubit extends Cubit<AllChatClientState> {
  final ChatRepo chatRepo;
  AllChatClientCubit(this.chatRepo) : super(AllChatClientInitial());
  Future<void> allChat() async {
    emit(AllChatClientLoading());
    final result = await chatRepo.allChat();

    result.fold(
      (failure) => emit(AllChatClientFailure(failure.errorMessage)),
      (data) => emit(AllChatClientSuccess(data)),
    );
  }
}
