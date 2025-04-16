
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Profile%20User/data/repo/profile_repository_impl.dart';
import 'update_provider_profile_state.dart';
class UpdateProviderProfileCubit extends Cubit<UpdateProviderProfileState> {
  final ProfileRepositoryImpl profileRepositoryImpl;

  UpdateProviderProfileCubit(this.profileRepositoryImpl)
      : super(UpdateProviderProfileInitial());

  Future<void> updateProviderProfile({
    required String fullName,
    required String mobileNumber,
    required String age,
    required String yearsOfExperience,
    required String jobTitle,
    required String bio,
    required int priceRange,
  }) async {
    emit(UpdateProviderProfileLoading());

    Map<String, dynamic> data = {
      'fullName': fullName,
      'mobileNumber': mobileNumber,
      'age': age,
      'yearsOfExperience': yearsOfExperience,
      'jobTitle': jobTitle,
      'bio': bio,
      'priceRange': priceRange,
    };

    final result = await profileRepositoryImpl.updateProviderProfile(data);

    result.fold(
      (failure) {
        emit(UpdateProviderProfileFailure(failure.errorMessage));
      },
      (_) {
        emit(UpdateProviderProfileSuccess());
      },
    );
  }
}
