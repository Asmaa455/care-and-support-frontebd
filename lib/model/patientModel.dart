import 'package:supcar/model/userModel.dart';

class Patient {
  final int id;
  final int userId;
  final int age;
  final String gender;
  final String diseases;
  final String? paperToProveCancer;
  final String? image;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User user;

  Patient({
    required this.id,
    required this.userId,
    required this.age,
    required this.gender,
    required this.diseases,
    this.paperToProveCancer,
    this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      age: json['age'] ?? 0,
      gender: json['gender'] ?? '',
      diseases: json['diseases'] ?? '',
      paperToProveCancer: json['paper_to_prove_cancer'] as String?,
      image: json['image'] as String?,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      user: User.fromJson(json['user'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'age': age,
      'gender': gender,
      'diseases': diseases,
      'paper_to_prove_cancer': paperToProveCancer,
      'image': image,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'user': user.toJson(),
    };
  }
}
