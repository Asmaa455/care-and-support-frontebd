class consultatioModel {
  List<Consultations>? _consultations;

  consultatioModel({List<Consultations>? consultations}) {
    if (consultations != null) {
      this._consultations = consultations;
    }
  }

  List<Consultations>? get consultations => _consultations;
  set consultations(List<Consultations>? consultations) =>
      _consultations = consultations;

  consultatioModel.fromJson(Map<String, dynamic> json) {
    if (json['consultations'] != null) {
      _consultations = <Consultations>[];
      json['consultations'].forEach((v) {
        _consultations!.add(new Consultations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._consultations != null) {
      data['consultations'] =
          this._consultations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Consultations {
  int? _id;
  int? _patientId;
  int? _doctorId;
  String? _consultationText;
  int? _status;
  String? _answerText;
  String? _createdAt;
  String? _updatedAt;

  Consultations(
      {int? id,
      int? patientId,
      int? doctorId,
      String? consultationText,
      int? status,
      String? answerText,
      String? createdAt,
      String? updatedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (patientId != null) {
      this._patientId = patientId;
    }
    if (doctorId != null) {
      this._doctorId = doctorId;
    }
    if (consultationText != null) {
      this._consultationText = consultationText;
    }
    if (status != null) {
      this._status = status;
    }
    if (answerText != null) {
      this._answerText = answerText;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get patientId => _patientId;
  set patientId(int? patientId) => _patientId = patientId;
  int? get doctorId => _doctorId;
  set doctorId(int? doctorId) => _doctorId = doctorId;
  String? get consultationText => _consultationText;
  set consultationText(String? consultationText) =>
      _consultationText = consultationText;
  int? get status => _status;
  set status(int? status) => _status = status;
  String? get answerText => _answerText;
  set answerText(String? answerText) => _answerText = answerText;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  Consultations.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _patientId = json['patient_id'];
    _doctorId = json['doctor_id'];
    _consultationText = json['consultation_text'];
    _status = json['status'];
    _answerText = json['answer_text'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['patient_id'] = this._patientId;
    data['doctor_id'] = this._doctorId;
    data['consultation_text'] = this._consultationText;
    data['status'] = this._status;
    data['answer_text'] = this._answerText;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}
