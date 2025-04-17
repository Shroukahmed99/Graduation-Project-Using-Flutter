import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sehatak/Features/articles/data/models/add_article_model.dart';
import 'package:sehatak/Features/articles/data/repo/article_repo.dart';
import 'package:sehatak/core/error/failure.dart';

part 'add_article_state.dart';

class AddArticleCubit extends Cubit<AddArticleState> {
  final ArticleRepo articleRepo;
  bool isPickingImage = false;

  AddArticleCubit(this.articleRepo) : super(AddArticleInitial());

  // دالة إضافة المقال
  Future<void> addArticle({
    required String title,
    required String content,
    required String serviceProviderId,
    File? image,
  }) async {
    emit(AddArticleLoading());
    Either<Failure, AddArticleModel> result = await articleRepo.addArticle(
      title: title,
      content: content,
      serviceProviderId: serviceProviderId,
      image: image,
    );

    result.fold(
      (failure) => emit(AddArticleFailure(failure.errorMessage)),
      (article) => emit(AddArticleSuccess(article)),
    );
  }

  // دالة لاختيار الصورة
  void selectImage(File image) {
    emit(AddArticleImageSelected(image));
  }

  // دالة لاختيار صورة من المعرض
  Future<void> pickImage() async {
    if (isPickingImage) return;
    isPickingImage = true;

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    isPickingImage = false;

    if (pickedFile != null) {
      selectImage(File(pickedFile.path)); // إرسال الصورة التي تم اختيارها
    }
  }
}
