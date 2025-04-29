// import 'dart:io';

// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:http_parser/http_parser.dart';
// import 'package:sehatak/Features/Community/data/models/create_post.dart';
// import 'package:sehatak/Features/Community/data/repo/community_repo.dart';
// import 'package:sehatak/core/error/failure.dart';
// import 'package:sehatak/core/utils/api_service.dart';

// class CommunityRepoImpl implements CommunityRepo {
//   final ApiService apiService;

//   CommunityRepoImpl(this.apiService);

//   @override
//   Future<Either<Failure, NewCommunity>> addPost({
//     required String content,
//     required String serviceProviderId,
//     File? image,
//   }) async {
//     try {
//       MultipartFile? multipartFile;
//       if (image != null && image.existsSync()) {
//         String mimeType = getMimeType(image.path);
//         multipartFile = await MultipartFile.fromFile(
//           image.path,
//           filename: image.path.split('/').last,
//           contentType:
//               MediaType(mimeType.split('/')[0], mimeType.split('/')[1]),
//         );
//       }

//       FormData formData = FormData.fromMap({
//         'content': content,
//         'serviceproviderId': serviceProviderId,
//         if (multipartFile != null) 'img': multipartFile,
//       });

//       final response = await apiService.post(
//         endpoint: 'community/createPost',
//         data: formData,
//       );

//       if (response['status'] == 'success') {
//         if (response['data'] != null && response['data'] is Map) {
//           final communityResponse = CommunityResponse.fromJson(response);
//           return Right(communityResponse.data.newCommunity);
//         } else {
//           return Left(ServerFailure('Data is not in the expected format.'));
//         }
//       } else {
//         return Left(ServerFailure(response['message'] ?? 'Unexpected error'));
//       }
//     } on DioException catch (e) {
//       return Left(ServerFailure.fromDioError(e));
//     } catch (e) {
//       return Left(ServerFailure(e.toString()));
//     }
//   }

//   String getMimeType(String filePath) {
//     final extension = filePath.split('.').last.toLowerCase();
//     switch (extension) {
//       case 'jpg':
//       case 'jpeg':
//         return 'image/jpeg';
//       case 'png':
//         return 'image/png';
//       case 'gif':
//         return 'image/gif';
//       case 'bmp':
//         return 'image/bmp';
//       case 'webp':
//         return 'image/webp';
//       default:
//         return 'application/octet-stream';
//     }
//   }
// }
