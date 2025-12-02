import 'book_dto.dart';

class SearchBooksResponse {
  final String msg;
  final List<BookDto> books;

  SearchBooksResponse({
    required this.msg,
    required this.books,
  });

  factory SearchBooksResponse.fromJson(Map<String, dynamic> json) =>
      SearchBooksResponse(
        msg: json['msg'],
        books: (json['Books'] as List)
            .map((e) => BookDto.fromJson(e))
            .toList(),
      );
}
