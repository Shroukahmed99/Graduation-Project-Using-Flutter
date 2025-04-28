import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sehatak/Features/home%20service/data/models/custmer_new_model.dart';
import 'package:sehatak/Features/home%20service/data/repo/home_service_repo.dart';

part 'new_custmer_state.dart';

class NewCustmerCubit extends Cubit<NewCustmerState> {
  final HomeServiceRepo homeServiceRepo;

  NewCustmerCubit(this.homeServiceRepo) : super(NewCustmerInitial());
  Future<void> fetchNewCustemr() async {
    emit(NewCustmerLoading());
    final result = await homeServiceRepo.fetchNewCustemr();

    result.fold(
      (failure) => emit(NewCustmerFaliure(failure.errorMessage)),
      (data) => emit(NewCustmerSuccess(data)),
    );
  }
}
