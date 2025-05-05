import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Profile%20User/data/repo/profile_repository_impl.dart';
import 'package:sehatak/Features/Profile%20User/presentation/manger/profile%20provider%20cubit/provider_cubit.dart';
import 'update_provider_profile_state.dart';


class UpdateProviderProfileCubit extends Cubit<UpdateProviderProfileState> {
  final ProfileRepositoryImpl profileRepositoryImpl;
  final ProfileProviderCubit profileProviderCubit;

  UpdateProviderProfileCubit(
    this.profileRepositoryImpl,
    this.profileProviderCubit,
  ) : super(UpdateProviderProfileInitial());
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


  try {
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
      (response) {
        emit(UpdateProviderProfileSuccess());
        profileProviderCubit.getProviderData();
      },
    );
  } catch (e) {
    emit(UpdateProviderProfileFailure('An unexpected error occurred: ${e.toString()}'));
  }
}

}