import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatak/Features/auth/Presentation/manger/signup%20cubits/signup%20provider/sign_up_provider_state.dart';
import 'package:sehatak/Features/auth/data/model/login_model.dart';
import 'package:sehatak/Features/auth/data/repo/users_repo.dart';
import 'package:sehatak/core/error/failure.dart';
import 'package:sehatak/core/utils/cache_helper.dart';

class SignUpProviderCubit extends Cubit<SignUpProviderState> {
  final UsersRepo usersRepo;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SignUpProviderCubit(this.usersRepo) : super(SignUpProviderInitial());

  Future<void> signUpUser() async {
    if (formKey.currentState == null || !formKey.currentState!.validate()) {
      return;
    }

    emit(SignUpProviderLoading());

    String fullName = CacheHelper.getData(key: 'fullName')?.toString() ?? '';
    String email = CacheHelper.getData(key: 'email')?.toString() ?? '';
    String mobileNumber =
        CacheHelper.getData(key: 'mobileNumber')?.toString() ?? '';
    String password = CacheHelper.getData(key: 'password')?.toString() ?? '';
    String passwordConfirm =
        CacheHelper.getData(key: 'passwordConfirm')?.toString() ?? '';
    String gender = CacheHelper.getData(key: 'gender')?.toString() ?? '';
    String age = CacheHelper.getData(key: 'age')?.toString() ?? '';
    String job = CacheHelper.getData(key: 'job')?.toString() ?? '';
    String yearsOfExperience =
        CacheHelper.getData(key: 'yearsOfExperience')?.toString() ?? '';
    String jobTitle = CacheHelper.getData(key: 'jobTitle')?.toString() ?? '';
    String bio = CacheHelper.getData(key: 'bio')?.toString() ?? '';
    String priceRange =
        CacheHelper.getData(key: 'priceRange')?.toString() ?? '450';

    String? filePath = CacheHelper.getData(key: 'identifier')?.toString();
    File? identifier =
        (filePath != null && filePath.isNotEmpty) ? File(filePath) : null;

    Either<Failure, UsersModel> result = await usersRepo.signUpProvider(
      fullName: fullName,
      email: email,
      mobileNumber: mobileNumber,
      password: password,
      passwordConfirm: passwordConfirm,
      gender: gender,
      age: age,
      job: job,
      yearsOfExperience: yearsOfExperience,
      jobTitle: jobTitle,
      bio: bio,
      priceRange: priceRange,
      identifier: identifier ?? File(''),
    );

    result.fold(
      (failure) {
        emit(SignUpProviderFailure(failure.errorMessage));
      },
      (usersModel) async {
        if (usersModel.token != null) {
          await CacheHelper.saveData(key: 'token', value: usersModel.token);
          emit(SignUpProviderSuccess(usersModel));
        } else {
          emit(SignUpProviderFailure("API Response missing token!"));
        }
      },
    );
  }
}
