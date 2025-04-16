import 'package:sehatak/Features/Profile%20User/data/models/update_profile_client_model.dart';

abstract class UpdateClientProfileState {}

class UpdateClientProfileInitial extends UpdateClientProfileState {}

class UpdateClientProfileLoading extends UpdateClientProfileState {}

class UpdateClientProfileSuccess extends UpdateClientProfileState {
  final UpdatedClient updatedClient;
  UpdateClientProfileSuccess(this.updatedClient);
}

class UpdateClientProfileFailure extends UpdateClientProfileState {
  final String error;
  UpdateClientProfileFailure(this.error);
}