class PhysicalTherapModel {
  final String id;
  final String fullName;
  final String bio;
  final int priceRange;

  PhysicalTherapModel({
    required this.id,
    required this.fullName,
    required this.bio,
    required this.priceRange,
  });

  factory PhysicalTherapModel.fromJson(Map<String, dynamic> json) {
    return PhysicalTherapModel(
      id: json['_id'],
      fullName: json['fullName'],
      bio: json['bio'],
      priceRange: json['priceRange'],
    );
  }
}

class PhysicalTherapistsResponse {
  final String status;
  final int results;
  final List<PhysicalTherapModel> physicalTherapists;

  PhysicalTherapistsResponse({
    required this.status,
    required this.results,
    required this.physicalTherapists,
  });

  factory PhysicalTherapistsResponse.fromJson(Map<String, dynamic> json) {
    var therapistsList = (json['data']['PhysicalTherapists'] as List)
        .map((item) => PhysicalTherapModel.fromJson(item))
        .toList();

    return PhysicalTherapistsResponse(
      status: json['status'],
      results: json['results'],
      physicalTherapists: therapistsList,
    );
  }
}
