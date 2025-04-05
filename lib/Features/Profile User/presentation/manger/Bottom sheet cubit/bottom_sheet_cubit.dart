import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/Bottom%20sheet%20cubit/bottom_sheet_state.dart';

class BottomSheetCubit extends Cubit<BottomSheetState> {
  BottomSheetCubit() : super(BottomSheetInitial());

  void showBottomSheet() {
    emit(BottomSheetVisible());
  }

  void hideBottomSheet() {
    emit(BottomSheetHidden());
  }

 
}
