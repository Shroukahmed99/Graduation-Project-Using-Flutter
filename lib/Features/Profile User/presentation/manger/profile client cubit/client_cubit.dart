// client_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Profile%20User/data/models/client_model.dart';
import 'package:sehatak/Features/Profile%20User/data/repo/profile_repository_impl.dart';

part 'client_state.dart';

class ProfileClientCubit extends Cubit<ClientState> {
  final ProfileRepositoryImpl profileRepositoryImpl;

  ProfileClientCubit(this.profileRepositoryImpl) : super(ClientInitial());

  ClientModel? clientData;

  Future<void> getClientData() async {
    emit(ClientLoading());
    
    final result = await profileRepositoryImpl.getClientById();
    
    result.fold(
      (failure) {
        emit(ClientFailure(failure.errorMessage));
      },
      (data) {
        if (data.data.client.isNotEmpty) {
          clientData = data.data.client.first;
          emit(ClientSuccess(clientData!));
        } else {
          emit(const ClientFailure("No client data found"));
        }
      },
    );
  }
}