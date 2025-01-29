import 'package:supcar/model/userModel.dart';

class Volunteersmodel {
  int id;
  int userId;
  int nationalNumber;
  int contactInformation;
  String? profilePicture;
  DateTime createdAt;
  DateTime? updatedAt;
  User user;

  Volunteersmodel({
    required this.id,
    required this.userId,
    required this.nationalNumber,
    required this.contactInformation,
    this.profilePicture,
    required this.createdAt,
    this.updatedAt,
    required this.user,
  });

  factory Volunteersmodel.fromJson(Map<String, dynamic> json) {
    return Volunteersmodel(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      nationalNumber: json['national_number'] ?? 0,
      contactInformation: json['contact_information'] ?? 0,
      profilePicture: json['image'] ?? '',
      createdAt: DateTime.parse(
          json['created_at'] ?? DateTime.now().toIso8601String()),
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
      'national_number': nationalNumber,
      'contact_information': contactInformation,
      'image': profilePicture,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'user': user.toJson(),
    };
  }
}
