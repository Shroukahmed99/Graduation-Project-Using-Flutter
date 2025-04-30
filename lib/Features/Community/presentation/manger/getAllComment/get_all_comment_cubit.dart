import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_all_comment_state.dart';

class GetAllCommentCubit extends Cubit<GetAllCommentState> {
  GetAllCommentCubit() : super(GetAllCommentInitial());
}
