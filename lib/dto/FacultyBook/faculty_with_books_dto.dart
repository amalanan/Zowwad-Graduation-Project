import 'book_dto.dart';

class FacultyWithBooksDto {
  final int id;
  final String name;
  final List<BookDto> books;

  FacultyWithBooksDto({
    required this.id,
    required this.name,
    required this.books,
  });

  factory FacultyWithBooksDto.fromJson(Map<String, dynamic> json) =>
      FacultyWithBooksDto(
        id: json['id'],
        name: json['name'],
        books: (json['books'] as List)
            .map((book) => BookDto.fromJson(book))
            .toList(),
      );
}
