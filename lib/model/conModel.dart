class Consultations {
  final int id;
  final int patientId;
  final int doctorId;
  final String consultationText;
  final int status;
  final String answerText;
  final String createdAt;
  final String updatedAt;

  Consultations(
      {required this.id,
      required this.patientId,
      required this.doctorId,
      required this.consultationText,
      required this.status,
      required this.answerText,
      required this.createdAt,
      required this.updatedAt});

  factory Consultations.fromJson(Map<String, dynamic> json) {
    return Consultations(
      id: json['id'] ?? 0,
      patientId: json['patient_id'] ?? 0,
      doctorId: json['doctor_id'] ?? 0,
      consultationText: json['consultation_text'] ?? '',
      status: json['status'] ?? 0,
      answerText: json['answer_text'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patient_id': patientId,
      'doctor_id': doctorId,
      'consultation_text': consultationText,
      'status': status,
      'answer_text': answerText,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
