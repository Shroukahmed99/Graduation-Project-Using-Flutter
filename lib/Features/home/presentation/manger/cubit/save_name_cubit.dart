import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Profile%20User/data/models/get_profile_client_model.dart';
import 'package:sehatak/Features/Profile%20User/data/models/get_profile_provider_model.dart';
import 'package:sehatak/Features/Profile%20User/data/repo/profile_repository_impl.dart';

part 'save_name_state.dart';

class SaveNameCubit extends Cubit<SaveNameState> {
  final ProfileRepositoryImpl profileRepository;

  SaveNameCubit(this.profileRepository) : super(SaveNameInitial());

  Future<void> fetchClientProfile() async {
    try {
      emit(SaveNameLoading());
      final result = await profileRepository.getClientById();

      result.fold(
        (failure) => emit(SaveNameError(failure.errorMessage)),
        (clientData) {
          emit(SaveNameClientLoaded(clientData.client!));
        },
      );
    } catch (e) {
      emit(SaveNameError("Error fetching client profile: ${e.toString()}"));
    }
  }

  Future<void> fetchProviderProfile() async {
    try {
      emit(SaveNameLoading());
      final result = await profileRepository.getProviderById();

      result.fold(
        (failure) => emit(SaveNameError(failure.errorMessage)),
        (providerData) {
          emit(SaveNameProviderLoaded(providerData.provider!));
        },
      );
    } catch (e) {
      emit(SaveNameError("Error fetching provider profile: ${e.toString()}"));
    }
  }
}
