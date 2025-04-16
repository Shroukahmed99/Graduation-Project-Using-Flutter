import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Profile%20User/data/repo/profile_repository.dart';
import 'update_client_profile_state.dart';

class UpdateClientProfileCubit extends Cubit<UpdateClientProfileState> {
  final ProfileRepository profileRepository;

  UpdateClientProfileCubit(this.profileRepository)
      : super(UpdateClientProfileInitial());

  Future<void> updateClientProfile({
    required String fullName,
    required String email,
    required String mobileNumber,
    required String age,
    required String weight,
    required String height,
    required String physicalActivityLevel,
    required String goal,
  }) async {
    emit(UpdateClientProfileLoading());
    try {
      final Map<String, dynamic> data = {
        'fullName': fullName,
        'email': email,
        'mobileNumber': mobileNumber,
        'age': age,
        'weight': weight,
        'height': height,
        'physicalActivityLevel': physicalActivityLevel,
        'goal': goal,
      };

      // Log the request data for debugging
      print('Sending data to API: $data');
      
      final result = await profileRepository.updateClientProfile(data);

      result.fold(
        (failure) {
          // Log the failure message
          print('API call failed: ${failure.errorMessage}');
          emit(UpdateClientProfileFailure(failure.errorMessage));
        },
        (updateProfileClientModel) {
          // Log the success result
          print('API call success: ${updateProfileClientModel.data.updatedClient}');
          emit(UpdateClientProfileSuccess(updateProfileClientModel.data.updatedClient));
        },
      );
    } catch (e) {
      // Log the error stack trace
      print('Error: ${e.toString()}');
      emit(UpdateClientProfileFailure('Something went wrong!'));
    }
  }
}
