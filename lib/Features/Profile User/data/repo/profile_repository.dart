import 'dart:io';
import '../../data/models/user_profile_model.dart';

// Repository interface
abstract class ProfileRepository {
  Future<UserProfileModel> getProfile();
  Future<bool> updateProfile(UserProfileModel profile);
  Future<String?> uploadProfileImage(File image);
  Future<bool> changePassword(String currentPassword, String newPassword);
  Future<bool> logout();
}
