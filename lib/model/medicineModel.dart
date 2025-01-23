import 'package:supcar/model/medication_time.dart';

class Medicinemodel {
  final int id;
  final int patientId;
  final String medicationName;
  final String amount;
  final String timeOfTakingTheDrug;
  final int dailyRepetition;
  final DateTime startDate;
  final int durationOfTakingTheDrug;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Medication> medicationTime;

  Medicinemodel({
    required this.id,
    required this.patientId,
    required this.medicationName,
    required this.amount,
    required this.timeOfTakingTheDrug,
    required this.dailyRepetition,
    required this.startDate,
    required this.durationOfTakingTheDrug,
    required this.createdAt,
    required this.updatedAt,
    required this.medicationTime,
  });

  factory Medicinemodel.fromJson(Map<String, dynamic> json) {
    return Medicinemodel(
      id: json['id'] is int
          ? json['id']
          : int.tryParse(json['id'].toString()) ?? 0,
      patientId: json['patient_id'] is int
          ? json['patient_id']
          : int.tryParse(json['patient_id'].toString()) ?? 0,
      medicationName: json['medication_name'] ?? '',
      amount: json['amount'] ?? '',
      timeOfTakingTheDrug: json['first_dose_time'] ?? '',
      dailyRepetition: json['times_per_day'] is int
          ? json['times_per_day']
          : int.tryParse(json['times_per_day'].toString()) ?? 0,
      startDate: DateTime.parse(json['start_date']),
      durationOfTakingTheDrug: json['duration_days'] is int
          ? json['duration_days']
          : int.tryParse(json['duration_days'].toString()) ?? 0,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      medicationTime: (json['reminder__times'] as List)
          .map((i) => Medication.fromJson(i))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patient_id': patientId,
      'medication_name': medicationName,
      'amount': amount,
      'time_of_taking_the_drug': timeOfTakingTheDrug,
      'daily_repetition': dailyRepetition,
      'start_date': startDate.toIso8601String(),
      'duration_of_taking_the_drug': durationOfTakingTheDrug,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'reminder__times': medicationTime.map((i) => i.toJson()).toList(),
    };
  }
}
