import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:sehatak/Features/Profile%20User/data/models/get_profile_client_model.dart';
import 'package:sehatak/Features/Profile%20User/data/repo/profile_repository_impl.dart';
import 'package:sehatak/core/error/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'client_state.dart';

class ProfileClientCubit extends Cubit<ClientState> {
  final ProfileRepositoryImpl profileRepository;

  ProfileClientCubit(this.profileRepository) : super(ClientInitial());

  GetProfileClientModel? clientData;

  Future<void> getClientData() async {
    print("🚀 Start fetching client data...");
    emit(ClientLoading());

    try {
      final Either<Failure, GetProfileClientModel> result =
          await profileRepository.getClientById();

      print("✅ Received result: $result");

      result.fold(
        (failure) {
          print("❌ Failure occurred: ${failure.errorMessage}");
          emit(ClientFailure(failure.errorMessage));
        },
        (data) {
          print("🎯 Client data fetched successfully: ${data.client}");
          clientData = data;
          emit(ClientSuccess(client: data.client!));
        },
      );
    } catch (e) {
      print("🛑 Unexpected error: $e");
      emit(ClientFailure("Unexpected error occurred"));
    }
  }
}
