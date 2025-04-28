import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sehatak/Features/home%20service/data/models/custmer_model.dart';
import 'package:sehatak/Features/home%20service/data/repo/home_service_repo.dart';

part 'custmer_state.dart';

class CustmerCubit extends Cubit<CustmerState> {
  final HomeServiceRepo homeServiceRepo;
  CustmerCubit(this.homeServiceRepo) : super(CustmerInitial());
  Future<void> fetchCustemr() async {
    emit(CustmerLoading());
    final result = await homeServiceRepo.fetchCustemr();

    result.fold(
      (failure) => emit(CustmerFaliure(failure.errorMessage)),
      (data) => emit(CustmerSuccess(data)),
    );
  }
}
