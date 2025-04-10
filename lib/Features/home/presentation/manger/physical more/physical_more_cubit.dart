import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sehatak/Features/home/data/models/more_physical_model.dart';
import 'package:sehatak/Features/home/data/repo/home_repo.dart';

part 'physical_more_state.dart';

class PhysicalMoreCubit extends Cubit<PhysicalMoreState> {
  final HomeRepo homeRepo;

  PhysicalMoreCubit(this.homeRepo) : super(PhysicalMoreInitial());
  Future<void> fetchPhysicalistById(String id) async {
    try {
      emit(PhysicalMoreLoading());
      final failureOrSuccess = await homeRepo.fetchPhysicalistById(id);
      failureOrSuccess.fold(
        (failure) => emit(PhysicalMoreFailure(failure.toString())),
        (physicalTherapistMore) =>
            emit(PhysicalMoreSuccess(physicalTherapistMore)),
      );
    } catch (e) {
      emit(PhysicalMoreFailure('Error: $e'));
    }
  }
}
