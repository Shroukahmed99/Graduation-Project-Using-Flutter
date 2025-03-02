part of 'role_cubit.dart';

abstract class RoleState {}

class RoleInitial extends RoleState {}

class RoleSelected extends RoleState {
  final bool isProvider;
  final bool isClient;

  RoleSelected({required this.isProvider, required this.isClient});
}
