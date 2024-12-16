import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:supcar/constent/color.dart';
import 'package:supcar/constent/stringtodata.dart';
import 'package:supcar/content/post.dart';
import 'package:supcar/controller/helpcontroller.dart';
import 'package:supcar/fonts/my_flutter_app_icons.dart';

class Volunteersmodel {
  int id;
  int userId;
  int nationalNumber;
  int contactInformation;
  String profilePicture;
  DateTime createdAt;
  DateTime? updatedAt;

  Volunteersmodel({
    required this.id,
    required this.userId,
    required this.nationalNumber,
    required this.contactInformation,
    required this.profilePicture,
    required this.createdAt,
    this.updatedAt,
  });

  factory Volunteersmodel.fromJson(Map<String, dynamic> json) {
    return Volunteersmodel(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      nationalNumber: json['national_number'] ?? 0,
      contactInformation: json['contact_information'] ?? 0,
      profilePicture: json['profile_picture'] ?? '',
      createdAt: DateTime.parse(
          json['created_at'] ?? DateTime.now().toIso8601String()),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'national_number': nationalNumber,
      'contact_information': contactInformation,
      'profile_picture': profilePicture,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
