import 'package:supcar/model/patientModel.dart';
import 'package:supcar/model/userModel.dart';
import 'package:supcar/model/volunteersModel.dart';

class HelpModel {
  final int id;
  final int patientId;
  final int? volunteerId; // Nullable
  final String aidType;
  final DateTime aidDate; // Corrected from sidDate to aidDate
  final String location;
  final String? additionalDetails; // Nullable
  final int status;
  final DateTime createdAt; // Changed to DateTime for consistency
  final DateTime updatedAt; // Changed to DateTime for consistency
  final Volunteersmodel? volunteer; // Nullable
  final Patient patient;

  HelpModel({
    required this.id,
    required this.patientId,
    this.volunteerId,
    required this.aidType,
    required this.aidDate,
    required this.location,
    this.additionalDetails,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.volunteer,
    required this.patient,
  });

  factory HelpModel.fromJson(Map<String, dynamic> json) {
    return HelpModel(
      id: json['id'] as int? ?? 0, // Simplified null check
      patientId: json['patient_id'] as int? ?? 0, // Simplified null check
      volunteerId: json['volunteer_id'] as int?, // Nullable
      aidType: json['aid_type'] as String? ?? '', // Simplified null check
      aidDate: DateTime.parse(
          json['aid_date'] as String? ?? ''), // Corrected field name
      location: json['location'] as String? ?? '', // Simplified null check
      additionalDetails: json['additional_details'] as String?, // Nullable
      status: json['status'] as int? ?? 0, // Simplified null check
      createdAt: DateTime.parse(
          json['created_at'] as String? ?? ''), // Changed to DateTime
      updatedAt: DateTime.parse(
          json['updated_at'] as String? ?? ''), // Changed to DateTime
      volunteer: json['volunteer'] != null
          ? Volunteersmodel.fromJson(json['volunteer'] as Map<String, dynamic>)
          : null, // Nullable
      patient: json['patient'] != null
          ? Patient.fromJson(json['patient'] as Map<String, dynamic>)
          : Patient(
              id: 0,
              userId: 0,
              age: 0,
              gender: '',
              diseases: '',
              paperToProveCancer: '',
              image: '',
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
              user: User(
                id: 0,
                firstName: '',
                secondName: '',
                email: '',
                createdAt: DateTime.now(),
              ),
            ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patient_id': patientId,
      'volunteer_id': volunteerId,
      'aid_type': aidType,
      'aid_date': aidDate.toIso8601String(), // Corrected field name
      'location': location,
      'additional_details': additionalDetails,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'volunteer': volunteer?.toJson(),
      'patient': patient.toJson(),
    };
  }
}
