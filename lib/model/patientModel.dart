class Patientmodel {
  int id;
  int userId;
  int age;
  String gender;
  String diseases;
  String? paperToProveCancer;
  String profilePicture;
  DateTime createdAt;
  DateTime? updatedAt;

  Patientmodel({
    required this.id,
    required this.userId,
    required this.age,
    required this.gender,
    required this.diseases,
    this.paperToProveCancer,
    required this.profilePicture,
    required this.createdAt,
    this.updatedAt,
  });

  factory Patientmodel.fromJson(Map<String, dynamic> json) {
    return Patientmodel(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      age: json['age'] ?? 0,
      gender: json['gender'] ?? '',
      diseases: json['diseases'] ?? '',
      paperToProveCancer: json['paper_to_prove_cancer'],
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
      'age': age,
      'gender': gender,
      'diseases': diseases,
      'paper_to_prove_cancer': paperToProveCancer,
      'profile_picture': profilePicture,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
