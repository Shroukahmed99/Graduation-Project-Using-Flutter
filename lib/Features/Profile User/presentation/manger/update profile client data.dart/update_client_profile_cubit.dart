import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Profile%20User/data/repo/profile_repository.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/profile%20client%20cubit/client_cubit.dart';
import 'update_client_profile_state.dart';

class UpdateClientProfileCubit extends Cubit<UpdateClientProfileState> {
  final ProfileRepository profileRepository;
  final ProfileClientCubit profileClientCubit;
  UpdateClientProfileCubit(this.profileRepository, this.profileClientCubit)
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

      
      final result = await profileRepository.updateClientProfile(data);

      result.fold(
        (failure) {
          emit(UpdateClientProfileFailure(failure.errorMessage));
        },
        (updateProfileClientModel) {
          emit(UpdateClientProfileSuccess(updateProfileClientModel.data.updatedClient));
          profileClientCubit.getClientData(); 
        },
      );
    } catch (e) {
      emit(UpdateClientProfileFailure('Something went wrong!'));
    }
  }
}
