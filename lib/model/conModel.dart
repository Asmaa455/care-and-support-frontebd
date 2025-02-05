import 'package:supcar/model/doctorModel.dart';
import 'package:supcar/model/patientModel.dart';
import 'package:supcar/model/userModel.dart';

class Consultations {
  final int id;
  final int patientId;
  final int doctorId;
  final String consultationText;
  final int status;
  final String answerText;
  final String paymentStatus;
  final String paymentId;
  final String createdAt;
  final String updatedAt;
  final Doctor doctor;
  final Patient patient;

  Consultations({
    required this.id,
    required this.patientId,
    required this.doctorId,
    required this.consultationText,
    required this.status,
    required this.answerText,
    required this.paymentStatus,
    required this.paymentId,
    required this.createdAt,
    required this.updatedAt,
    required this.doctor,
    required this.patient,
  });

  factory Consultations.fromJson(Map<String, dynamic> json) {
    return Consultations(
      id: json['id'] ?? 0,
      patientId: json['patient_id'] ?? 0,
      doctorId: json['doctor_id'] ?? 0,
      consultationText: json['consultation_text'] ?? '',
      status: json['status'] ?? 0,
      answerText: json['answer_text'] ?? '',
      paymentStatus: json['payment_status'] ?? '',
      paymentId: json['payment_id'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      doctor: json['doctor'] != null
          ? Doctor.fromJson(json['doctor'])
          : Doctor(
              id: 0,
              userId: 0,
              specialization: '',
              certificatePhoto: '',
              contactInformation: 0,
              clinicLocation: '',
              profilePicture: '',
              user: User(
                  id: 0,
                  firstName: '',
                  secondName: '',
                  email: '',
                  type: '',
                  createdAt: DateTime.now())),
      patient: json['patient'] != null
          ? Patient.fromJson(json['patient'])
          : Patient(
              id: 0,
              userId: 0,
              age: 0,
              gender: '',
              diseases: '',
              paperToProveCancer: '',
              image: '',
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
              user: User(
                  id: 0,
                  firstName: '',
                  secondName: '',
                  email: '',
                  type: '',
                  createdAt: DateTime.now())),
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
      'payment_status': paymentStatus,
      'payment_id': paymentId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'doctor': doctor.toJson(),
      'patient': patient.toJson(),
    };
  }
}
