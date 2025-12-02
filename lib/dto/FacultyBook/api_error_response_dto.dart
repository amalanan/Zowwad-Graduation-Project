class ApiErrorResponseDto {
  final String message;
  final Map<String, dynamic>? errors;

  ApiErrorResponseDto({
    required this.message,
    this.errors,
  });

  factory ApiErrorResponseDto.fromJson(Map<String, dynamic> json) =>
      ApiErrorResponseDto(
        message: json['message'],
        errors: json['errors'],
      );
}
