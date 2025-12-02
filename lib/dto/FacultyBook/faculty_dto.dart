class FacultyDto {
  final int id;
  final String name;
  final String? createdAt;
  final String? updatedAt;

  FacultyDto({
    required this.id,
    required this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory FacultyDto.fromJson(Map<String, dynamic> json) => FacultyDto(
    id: json['id'],
    name: json['name'],
    createdAt: json['created_at'],
    updatedAt: json['updated_at'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}
