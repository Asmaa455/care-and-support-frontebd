import 'package:supcar/model/patientModel.dart';
import 'package:supcar/model/userModel.dart';
import 'package:supcar/model/volunteersModel.dart';

class HelpModel {
  final int id;
  final int patientId;
  final int volunteerId;
  final String aidType;
  final String sidDate;
  final String location;
  final String additionalDetails;
  final int status;
  final String createdAt;
  final String updatedAt;
  Volunteersmodel? volunteer;
  final Patient patient;

  HelpModel({
    required this.id,
    required this.patientId,
    required this.volunteerId,
    required this.aidType,
    required this.sidDate,
    required this.location,
    required this.additionalDetails,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.volunteer,
    required this.patient,
  });

  factory HelpModel.fromJson(Map<String, dynamic> json) {
    return HelpModel(
      id: json['id'] is int
          ? json['id']
          : int.tryParse(json['id'].toString()) ?? 0,
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
      status: json['status'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      volunteer: json['volunteer'] != null
          ? Volunteersmodel.fromJson(json['volunteer'])
          : null,
      patient: json['patient'] != null
          ? Patient.fromJson(json['patient'])
          : Patient(
              id: 0,
              userId: 0,
              age: 0,
              gender: '',
              diseases: '',
              paperToProveCancer: '',
              profilePicture: '',
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
              user: User(
                  id: 0,
                  firstName: '',
                  secondName: '',
                  email: '',
                  createdAt: DateTime.now())),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patient_id': patientId,
      'volunteer_id': volunteerId,
      'aid_type': aidType,
      'sid_date': sidDate,
      'location': location,
      'additional_details': additionalDetails,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'volunteer': volunteer?.toJson(),
      'patient': patient.toJson(),
    };
  }
}
