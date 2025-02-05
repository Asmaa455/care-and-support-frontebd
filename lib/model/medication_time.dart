import 'package:flutter/material.dart';

class Medication {
  final int id;
  final int medicationTimeId;
  final DateTime date;
  final TimeOfDay time;
  final int status;
  final DateTime createdAt;
  final DateTime updatedAt;

  Medication({
    required this.id,
    required this.medicationTimeId,
    required this.date,
    required this.time,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Medication.fromJson(Map<String, dynamic> json) {
    return Medication(
      id: json['id'] is int
          ? json['id']
          : int.tryParse(json['id'].toString()) ?? 0,
      medicationTimeId: json['medication__time_id'] is int
          ? json['medication__time_id']
          : int.tryParse(json['medication__time_id'].toString()) ?? 0,
      date: DateTime.parse(json['date']),
      time: TimeOfDay(
        hour: int.parse(json['time'].split(":")[0]),
        minute: int.parse(json['time'].split(":")[1]),
      ),
      status: json['status'] ?? 0,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'medication__time_id': medicationTimeId,
      'date': date.toIso8601String(),
      'time': '${time.hour}:${time.minute}:00',
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
