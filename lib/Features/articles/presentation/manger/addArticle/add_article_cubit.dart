import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sehatak/Features/articles/data/models/add_article_model.dart';
import 'package:sehatak/Features/articles/data/repo/article_repo.dart';

part 'add_article_state.dart';

class AddArticleCubit extends Cubit<AddArticleState> {
  final ArticleRepo articleRepo;
  bool isPicking = false;

  AddArticleCubit(this.articleRepo) : super(AddArticleInitial());

  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  File? selectedImage;

  Future<void> pickImage() async {
    if (isPicking) return;
    isPicking = true;
    emit(AddArticleLoading());

    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        selectedImage = File(pickedFile.path);
        emit(AddArticleImagePicked());
      } else {
        emit(AddArticleInitial());
      }
    } catch (e) {
      emit(AddArticleFailure("Error picking image: $e"));
    } finally {
      isPicking = false;
    }
  }

  void clearAll() {
    titleController.clear();
    contentController.clear();
    selectedImage = null;
    emit(AddArticleInitial());
  }

  Future<void> submitArticle(String serviceProviderId) async {
    emit(AddArticleLoading());

    final result = await articleRepo.addArticle(
      title: titleController.text,
      content: contentController.text,
      image: selectedImage,
    );

    result.fold(
      (failure) => emit(AddArticleFailure(failure.errorMessage)),
      (article) => emit(AddArticleSuccess(article)),
    );
  }

  @override
  Future<void> close() {
    titleController.dispose();
    contentController.dispose();
    return super.close();
  }
}
