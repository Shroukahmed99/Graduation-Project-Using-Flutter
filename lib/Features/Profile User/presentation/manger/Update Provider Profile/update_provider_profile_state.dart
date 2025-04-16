// update_provider_profile_state.dart

abstract class UpdateProviderProfileState {}

class UpdateProviderProfileInitial extends UpdateProviderProfileState {}

class UpdateProviderProfileLoading extends UpdateProviderProfileState {}

class UpdateProviderProfileSuccess extends UpdateProviderProfileState {}

class UpdateProviderProfileFailure extends UpdateProviderProfileState {
  final String errorMessage;

  UpdateProviderProfileFailure(this.errorMessage);
}
