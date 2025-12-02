import 'faculty_with_books_dto.dart';

class FacultyBooksResponseDto {
  final FacultyWithBooksDto faculty;

  FacultyBooksResponseDto({required this.faculty});

  factory FacultyBooksResponseDto.fromJson(Map<String, dynamic> json) =>
      FacultyBooksResponseDto(
        faculty: FacultyWithBooksDto.fromJson(json['Faculty']),
      );
}
