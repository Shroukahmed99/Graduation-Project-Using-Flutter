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
    emit(ProviderLoading());

    final Either<Failure, GetProfileProviderModel> result =
        await profileRepositoryImpl.getProviderById();

    result.fold(
      (failure) {
        emit(ProviderFailure(failure.errorMessage));
      },
      (data) {
        providerData = data;
        emit(ProviderSuccess(data));
      },
    );
  }
}