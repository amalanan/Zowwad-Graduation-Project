class BookDto {
  final int id;
  final String title;
  final String? author;
  final String? status;
  final String? userName;
  final String? facultyName;
  final String? image;
  final String? coverImage;
  final String? condition;
  final String? createdAt;

  BookDto({
    required this.id,
    required this.title,
    this.author,
    this.status,
    this.userName,
    this.facultyName,
    this.image,
    this.coverImage,
    this.condition,
    this.createdAt,
  });

  factory BookDto.fromJson(Map<String, dynamic> json) => BookDto(
    id: json['id'],
    title: json['title'],
    author: json['author'],
    status: json['status'],
    userName: json['user_name'],
    facultyName: json['faculty name'],
    image: json['image'],
    coverImage: json['cover_image'],
    condition: json['condition'],
    createdAt: json['created_at'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'author': author,
    'status': status,
    'user_name': userName,
    'faculty name': facultyName,
    'image': image,
    'cover_image': coverImage,
    'condition': condition,
    'created_at': createdAt,
  };
}
