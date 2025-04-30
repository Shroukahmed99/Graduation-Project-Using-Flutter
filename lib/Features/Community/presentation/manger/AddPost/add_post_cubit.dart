import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:sehatak/Features/Community/data/models/create_post.dart';
import 'package:sehatak/Features/Community/data/repo/community_repo.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  final CommunityRepo communityRepo;
  bool isPicking = false;
  AddPostCubit(this.communityRepo) : super(AddPostInitial());
  final TextEditingController contentController = TextEditingController();
  File? selectedImage;

  Future<void> pickImage() async {
    if (isPicking) return;
    isPicking = true;
    emit(AddPostLoading());

    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        selectedImage = File(pickedFile.path);
        emit(AddPostmagePicked());
      } else {
        emit(AddPostInitial());
      }
    } catch (e) {
      emit(AddPostFailure("Error picking image: $e"));
    } finally {
      isPicking = false;
    }
  }

  void clearAll() {
    contentController.clear();
    selectedImage = null;
    emit(AddPostInitial());
  }

  Future<void> submitpost() async {
    emit(AddPostLoading());

    final result = await communityRepo.addPost(
      content: contentController.text,
      image: selectedImage,
    );

    result.fold(
      (failure) => emit(AddPostFailure(failure.errorMessage)),
      (article) => emit(AddPostSuccess(article)),
    );
  }

  @override
  Future<void> close() {
    contentController.dispose();
    return super.close();
  }
}
