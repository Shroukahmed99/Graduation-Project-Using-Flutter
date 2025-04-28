import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/Profile%20User/data/models/get_profile_provider_model.dart';
import 'package:sehatak/Features/Profile%20User/data/repo/profile_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:sehatak/core/error/failure.dart';

part 'provider_state.dart';

class ProfileProviderCubit extends Cubit<ProviderState> {
  final ProfileRepositoryImpl profileRepositoryImpl;

  ProfileProviderCubit(this.profileRepositoryImpl) : super(ProviderInitial());

  GetProfileProviderModel? providerData;

  Future<void> getProviderData() async {
    try {
      if (isClosed) return;

      emit(ProviderLoading());

      final Either<Failure, GetProfileProviderModel> result =
          await profileRepositoryImpl.getProviderById();

      result.fold(
        (failure) {
          if (!isClosed) {
            emit(ProviderFailure(failure.errorMessage));
          }
        },
        (data) {
          providerData = data;
          if (!isClosed) {
            if (data.provider != null) {
              emit(ProviderSuccess(provider: data.provider!));
            } else {
              emit(ProviderFailure(
                  'No data available for the service provider'));
            }
          }
        },
      );
    } catch (e) {
      print('🚨 Exception in getProviderData: ${e.toString()}');
      if (!isClosed) {
        emit(ProviderFailure('An unexpected error occurred: ${e.toString()}'));
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
