import 'package:Zowwad/dto/FacultyBook/faculty_dto.dart';

import 'faculty_with_books_dto.dart';

class FacultyFilterResponseDto {
  final String msg;
  final List<FacultyWithBooksDto> faculties;

  FacultyFilterResponseDto({
    required this.msg,
    required this.faculties,
  });

  factory FacultyFilterResponseDto.fromJson(Map<String, dynamic> json) =>
      FacultyFilterResponseDto(
        msg: json['msg'],
        faculties: (json['faculty'] as List)
            .map((f) => FacultyWithBooksDto.fromJson(f))
            .toList(),
      );

  List<FacultyDto> toFacultyDtoList() {
    return faculties.map((facultyWithBooks) {
      return FacultyDto(
        id: facultyWithBooks.id,
        name: facultyWithBooks.name,
        createdAt: null, // or map if available
        updatedAt: null, // or map if available
      );
    }).toList();
  }

}
