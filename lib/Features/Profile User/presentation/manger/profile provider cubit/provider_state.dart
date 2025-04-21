part of 'provider_cubit.dart';


abstract class ProviderState {}

class ProviderInitial extends ProviderState {}

class ProviderLoading extends ProviderState {}

class ProviderSuccess extends ProviderState {
  final ProviderModel provider;

ProviderSuccess({required this.provider});}


class ProviderFailure extends ProviderState {
  final String message;

  ProviderFailure(this.message);
}