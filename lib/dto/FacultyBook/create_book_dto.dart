import 'dart:io';

class CreateBookRequestDto {
  final String title;
  final File? image;         // Single image
  final File? coverImage;   // Optional cover image
  final String condition;
  final String status;
  final String name;        // Faculty name

  CreateBookRequestDto({
    required this.title,
    required this.image,
    this.coverImage,
    required this.condition,
    required this.status,
    required this.name,
  });
}
