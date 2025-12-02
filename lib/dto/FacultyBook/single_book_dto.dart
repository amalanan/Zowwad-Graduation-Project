class SingleBookDto {
  final String name;
  final String status;
  final String email;

  SingleBookDto({
    required this.name,
    required this.status,
    required this.email,
  });

  factory SingleBookDto.fromJson(Map<String, dynamic> json) => SingleBookDto(
    name: json['Book']['name'],
    status: json['Book']['status'],
    email: json['Book']['email'],
  );
}
