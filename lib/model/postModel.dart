class Postmodel {
  int id;
  int doctorId;
  String title;
  String content;
  String category;
  DateTime? deletedAt;
  DateTime createdAt;
  DateTime? updatedAt;

  Postmodel({
    required this.id,
    required this.doctorId,
    required this.title,
    required this.content,
    required this.category,
    this.deletedAt,
    required this.createdAt,
    this.updatedAt,
  });

  factory Postmodel.fromJson(Map<String, dynamic> json) {
    return Postmodel(
      id: json['id'],
      doctorId: json['doctor_id'],
      title: json['title'],
      content: json['content'],
      category: json['category'] ?? "",
      deletedAt: json['deleted_at'] != null
          ? DateTime.parse(json['deleted_at'])
          : null,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'doctor_id': doctorId,
      'title': title,
      'content': content,
      'category': category,
      'deleted_at': deletedAt?.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
