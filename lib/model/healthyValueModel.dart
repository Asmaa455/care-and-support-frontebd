import 'package:get/get.dart';

class Healthyvaluemodel {
  int id;
  int patientId;
  int diseaseId;
  int value;
  String status;
  DateTime createAt;
  DateTime? updateAt;
  Healthyvaluemodel({
    required this.id,
    required this.patientId,
    required this.diseaseId,
    required this.value,
    required this.status,
    required this.createAt,
    this.updateAt,
  });

  factory Healthyvaluemodel.fromJson(Map<String, dynamic> json) {
    return Healthyvaluemodel(
      id: json['id'],
      patientId: json['patient_id'],
      diseaseId: json['disease_id'],
      value: json['value'],
      status: json['status'],
      createAt: DateTime.parse(json['created_at']),
      updateAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patient_id': patientId,
      'disease_id': diseaseId,
      'value': value,
      'status': status,
      'created_at': createAt.toIso8601String(),
      'updated_at': updateAt?.toIso8601String(),
    };
  }
}
