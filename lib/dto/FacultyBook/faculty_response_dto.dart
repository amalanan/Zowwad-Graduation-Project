import 'faculty_dto.dart';

class FacultyResponseDto {
  final String msg;
  final List<FacultyDto> faculties;

  FacultyResponseDto({
    required this.msg,
    required this.faculties,
  });

  factory FacultyResponseDto.fromJson(Map<String, dynamic> json) =>
      FacultyResponseDto(
        msg: json['msg'],
        faculties: (json['Faculties'] as List)
            .map((e) => FacultyDto.fromJson(e))
            .toList(),
      );
}
