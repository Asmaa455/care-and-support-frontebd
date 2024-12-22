import 'package:supcar/model/userModel.dart';

class Doctor {
  int id;
  int userId;
  String specialization;
  String certificatePhoto;
  int contactInformation;
  String clinicLocation;
  String profilePicture;
  DateTime? createdAt;
  DateTime? updatedAt;
  User user;

  Doctor({
    required this.id,
    required this.userId,
    required this.specialization,
    required this.certificatePhoto,
    required this.contactInformation,
    required this.clinicLocation,
    required this.profilePicture,
    this.createdAt,
    this.updatedAt,
    required this.user,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      specialization: json['specialization'] ?? '',
      certificatePhoto: json['certificate photo'] ?? '',
      contactInformation: json['contact_information'] ?? 0,
      clinicLocation: json['clinic_location'] ?? '',
      profilePicture: json['profile_picture'] ?? '',
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      user: json['user'] != null
          ? User.fromJson(json['user'])
          : User(
              id: 0,
              firstName: '',
              secondName: '',
              email: '',
              createdAt: DateTime.now()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'specialization': specialization,
      'certificate photo': certificatePhoto,
      'contact_information': contactInformation,
      'clinic_location': clinicLocation,
      'profile_picture': profilePicture,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'user': user.toJson(),
    };
  }
}
