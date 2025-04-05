// client_state.dart
part of 'client_cubit.dart';

abstract class ClientState {
  const ClientState();
}

class ClientInitial extends ClientState {}

class ClientLoading extends ClientState {}

class ClientSuccess extends ClientState {
  final ClientModel client;

  const ClientSuccess(this.client);
}

class ClientFailure extends ClientState {
  final String message;

  const ClientFailure(this.message);
}