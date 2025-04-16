part of 'provider_cubit.dart';


abstract class ProviderState {}

class ProviderInitial extends ProviderState {}

class ProviderLoading extends ProviderState {}

class ProviderSuccess extends ProviderState {
  final GetProfileProviderModel provider;

  ProviderSuccess(this.provider);
}

class ProviderFailure extends ProviderState {
  final String message;

  ProviderFailure(this.message);
}