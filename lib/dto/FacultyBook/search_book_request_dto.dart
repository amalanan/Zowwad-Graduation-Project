class BookSearchRequestDto {
  final String title;

  BookSearchRequestDto({required this.title});

  Map<String, dynamic> toJson() => {"title": title};
}
