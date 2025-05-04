part of 'save_name_cubit.dart';

sealed class SaveNameState {}

final class SaveNameInitial extends SaveNameState {}

final class SaveNameLoading extends SaveNameState {}

final class SaveNameClientLoaded extends SaveNameState {
  final ClientModel client;
  SaveNameClientLoaded(this.client);
}

final class SaveNameProviderLoaded extends SaveNameState {
  final ProviderModel provider;
  SaveNameProviderLoaded(this.provider);
}

final class SaveNameError extends SaveNameState {
  final String message;
  SaveNameError(this.message);
}
