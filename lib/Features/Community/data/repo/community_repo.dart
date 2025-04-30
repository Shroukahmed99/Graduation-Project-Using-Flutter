import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:sehatak/Features/Community/data/models/create_post.dart';
import 'package:sehatak/Features/Community/data/models/get_all_post.dart';
import 'package:sehatak/Features/Community/data/models/likes.dart';
import 'package:sehatak/core/error/failure.dart';

abstract class CommunityRepo {
  Future<Either<Failure, NewCommunity>> addPost({
    required String content,
    File? image,
  });

  Future<Either<Failure, List<GetCommunity>>> getAllPost();
  Future<Either<Failure, LikePostResponse>> likePost(String postId);
}
