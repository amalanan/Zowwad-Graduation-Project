class FacultyFilterRequestDto {
  final String name;

  FacultyFilterRequestDto({required this.name});

  Map<String, dynamic> toJson() => {"name": name};
}
