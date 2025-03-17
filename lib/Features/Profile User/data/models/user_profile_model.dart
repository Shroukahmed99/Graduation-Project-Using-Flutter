class UserProfileModel {
  final String fullName;
  final String email;
  final String phone;
  final String birthDate;
  final String weight;
  final String height;
  final String? profileImagePath;

  UserProfileModel({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.birthDate,
    required this.weight,
    required this.height,
    this.profileImagePath,
  });

  // Create a copy of the user profile model with updated fields
  UserProfileModel copyWith({
    String? fullName,
    String? email,
    String? phone,
    String? birthDate,
    String? weight,
    String? height,
    String? profileImagePath,
  }) {
    return UserProfileModel(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      birthDate: birthDate ?? this.birthDate,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      profileImagePath: profileImagePath ?? this.profileImagePath,
    );
  }

  // Convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'birthDate': birthDate,
      'weight': weight,
      'height': height,
      'profileImagePath': profileImagePath,
    };
  }

  // Create model from JSON
  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      birthDate: json['birthDate'] ?? '',
      weight: json['weight'] ?? '',
      height: json['height'] ?? '',
      profileImagePath: json['profileImagePath'],
    );
  }

  // Initial empty model
  factory UserProfileModel.empty() {
    return UserProfileModel(
      fullName: 'Full Name',
      email: 'email@example.com',
      phone: '',
      birthDate: 'Jan 1st',
      weight: '15 kg',
      height: '162 CM',
      profileImagePath: null,
    );
  }
}