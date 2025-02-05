import 'package:supcar/model/doctorModel.dart';

class Postmodel {
  int id;
  int doctorId;
  String title;
  String content;
  String category;
  DateTime? deletedAt;
  DateTime createdAt;
  DateTime? updatedAt;
  Doctor? doctor;

  Postmodel(
      {required this.id,
      required this.doctorId,
      required this.title,
      required this.content,
      required this.category,
      this.deletedAt,
      required this.createdAt,
      this.updatedAt,
      required this.doctor});

  factory Postmodel.fromJson(Map<String, dynamic> json) {
    return Postmodel(
        id: json['id'],
        doctorId: json['doctor_id'],
        title: json['title'],
        content: json['content'],
        category: json['category'] ?? "",
        deletedAt: json['deleted_at'] != null
            ? DateTime.parse(json['deleted_at'])
            : null,
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] != null
            ? DateTime.parse(json['updated_at'])
            : null,
        doctor: json['doctor'] != null
            ? Doctor.fromJson(json['doctor'] as Map<String, dynamic>)
            : null);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'doctor_id': doctorId,
      'title': title,
      'content': content,
      'category': category,
      'deleted_at': deletedAt?.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'doctor': doctor?.toJson(),
    };
  }
}
