class HelpModel {
  final int patientId;
  final int volunteerId;
  final String aidType;
  final String sidDate;
  final String location;
  final String additionalDetails;
  final String status;
  final String createdAt;
  final String updatedAt;

  HelpModel({
    required this.patientId,
    required this.volunteerId,
    required this.aidType,
    required this.sidDate,
    required this.location,
    required this.additionalDetails,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory HelpModel.fromJson(Map<String, dynamic> json) {
    return HelpModel(
      patientId: json['patient_id'] is int
          ? json['patient_id']
          : int.tryParse(json['patient_id'].toString()) ?? 0,
      volunteerId: json['volunteer_id'] is int
          ? json['volunteer_id']
          : int.tryParse(json['volunteer_id'].toString()) ?? 0,
      aidType: json['aid_type'] ?? '',
      sidDate: json['sid_date'] ?? '',
      location: json['location'] ?? '',
      additionalDetails: json['additional_details'] ?? '',
      status: json['status'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'patient_id': patientId,
      'volunteer_id': volunteerId,
      'aid_type': aidType,
      'sid_date': sidDate,
      'location': location,
      'additional_details': additionalDetails,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
