class consultatioModel {
  String? _message;
  Consultation1? _consultation1;

  consultatioModel({String? message, Consultation1? consultation1}) {
    if (message != null) {
      this._message = message;
    }
    if (consultation1 != null) {
      this._consultation1 = consultation1;
    }
  }

  String? get message => _message;
  set message(String? message) => _message = message;
  Consultation1? get consultation1 => _consultation1;
  set consultation1(Consultation1? consultation1) =>
      _consultation1 = consultation1;

  consultatioModel.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    _consultation1 = json['consultation1'] != null
        ? new Consultation1.fromJson(json['consultation1'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this._message;
    if (this._consultation1 != null) {
      data['consultation1'] = this._consultation1!.toJson();
    }
    return data;
  }
}

class Consultation1 {
  String? _patientId;
  String? _consultation1Text;
  String? _updatedAt;
  String? _createdAt;
  String? _id;

  Consultation1(
      {String? patientId,
      String? consultation1Text,
      String? updatedAt,
      String? createdAt,
      String? id}) {
    if (patientId != null) {
      this._patientId = patientId;
    }
    if (consultation1Text != null) {
      this._consultation1Text = consultation1Text;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (id != null) {
      this._id = id;
    }
  }

  String? get patientId => _patientId;
  set patientId(String? patientId) => _patientId = patientId;
  String? get consultation1Text => _consultation1Text;
  set consultation1Text(String? consultation1Text) =>
      _consultation1Text = consultation1Text;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get id => _id;
  set id(String? id) => _id = id;

  Consultation1.fromJson(Map<String, dynamic> json) {
    _patientId = json['patient_id'];
    _consultation1Text = json['consultation1_text'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['patient_id'] = this._patientId;
    data['consultation1_text'] = this._consultation1Text;
    data['updated_at'] = this._updatedAt;
    data['created_at'] = this._createdAt;
    data['id'] = this._id;
    return data;
  }
}
