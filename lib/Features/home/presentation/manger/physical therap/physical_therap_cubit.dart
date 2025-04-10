import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sehatak/Features/home/data/models/physical_model.dart';
import 'package:sehatak/Features/home/data/repo/home_repo.dart';

part 'physical_therap_state.dart';

class PhysicalTherapCubit extends Cubit<PhysicalTherapState> {
  final HomeRepo homeRepo;
  PhysicalTherapCubit(this.homeRepo) : super(PhysicalTherapInitial());
  Future<void> fetchPhysicalTherap() async {
    emit(PhysicalTherapLoading());
    final result = await homeRepo.fetchPhysicalTherap();

    result.fold(
      (failure) => emit(PhysicalTherapFailure(failure.errorMessage)),
      (physicalTherapists) => emit(PhysicalTherapSuccess(physicalTherapists)),
    );
  }
}
