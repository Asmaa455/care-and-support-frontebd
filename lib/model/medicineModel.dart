class Medicinemodel {
  final int id;
  final int patientId;
  final String medicationName;
  final String amount;
  final String timeOfTakingTheDrug;
  final int dailyRepetition;
  final String startDate;
  final int durationOfTakingTheDrug;
  final int status;
  final String createdAt;
  final String updatedAt;
  // Map<String dynamic> timeMedicine{};

  Medicinemodel(
      {required this.id,
      required this.patientId,
      required this.medicationName,
      required this.amount,
      required this.timeOfTakingTheDrug,
      required this.dailyRepetition,
      required this.startDate,
      required this.durationOfTakingTheDrug,
      required this.status,
      required this.createdAt,
      required this.updatedAt});

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
      timeOfTakingTheDrug: json['time_of_taking_the_drug'] ?? '',
      dailyRepetition: json['daily_repetition'],
      startDate: json['start_date'] ?? '',
      durationOfTakingTheDrug: json['duration_of_taking_the_drug'] ?? '',
      status: json['status'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
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
      'start_date': startDate,
      'duration_of_taking_the_drug': durationOfTakingTheDrug,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
