// client_state.dart
part of 'client_cubit.dart';

abstract class ClientState {}

class ClientInitial extends ClientState {}

class ClientLoading extends ClientState {}

class ClientFailure extends ClientState {
  final String message;

  ClientFailure(this.message);
}

class ClientSuccess extends ClientState {
  final ClientModel client;

  ClientSuccess({required this.client});
}
