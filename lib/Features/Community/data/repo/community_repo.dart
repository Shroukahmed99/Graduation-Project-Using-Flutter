import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:sehatak/Features/Community/data/models/create_post.dart';
import 'package:sehatak/core/error/failure.dart';

abstract class CommunityRepo {
  Future<Either<Failure, NewCommunity>> addPost({
    required String content,
    required String serviceProviderId,
    File? image,
  });
}
