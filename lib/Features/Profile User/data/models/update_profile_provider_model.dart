import 'package:sehatak/Features/Profile%20User/data/models/get_profile_provider_model.dart';

class UpdateProfileProviderModel {
  final String status;
  final UpdateProviderData data;

  UpdateProfileProviderModel({
    required this.status,
    required this.data,
  });

  factory UpdateProfileProviderModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileProviderModel(
      status: json['status'],
      data: UpdateProviderData.fromJson(json['data']),
    );
  }
}

class UpdateProviderData {
  final UpdatedProvider updatedProvider;

  UpdateProviderData({
    required this.updatedProvider,
  });

  factory UpdateProviderData.fromJson(Map<String, dynamic> json) {
    return UpdateProviderData(
      updatedProvider: UpdatedProvider.fromJson(json['updatedServiceProvider']),
    );
  }
}

class UpdatedProvider {
  final String fullName;
  final String age;
  final String job;
  final String jobTitle;
  final String bio;
  final String identifier;
  final int priceRange;
  final String mobileNumber;
  final String yearsOfExperience;

  UpdatedProvider({
    required this.fullName,
    required this.age,
    required this.job,
    required this.jobTitle,
    required this.bio,
    required this.identifier,
    required this.priceRange,
    required this.mobileNumber,
    required this.yearsOfExperience,
  });

  factory UpdatedProvider.fromJson(Map<String, dynamic> json) {
    return UpdatedProvider(
      fullName: json['fullName'],
      age: json['age'],
      job: json['job'],
      jobTitle: json['jobTitle'],
      bio: json['bio'],
      identifier: json['identifier'],
      priceRange: json['priceRange'],
      mobileNumber: json['mobileNumber'],
      yearsOfExperience: json['yearsOfExperience'],
    );
  }

  factory UpdatedProvider.fromProviderProfile(ProviderProfile provider) {
    return UpdatedProvider(
      fullName: provider.fullName,
      age: provider.age,
      job: provider.job,
      jobTitle: provider.jobTitle,
      bio: provider.bio,
      identifier: provider.identifier,
      priceRange: provider.priceRange,
      mobileNumber: provider.mobileNumber,
      yearsOfExperience: provider.yearsOfExperience,
    );
  }
}
