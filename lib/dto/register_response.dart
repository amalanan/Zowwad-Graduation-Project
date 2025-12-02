import 'user_dto.dart';

class RegisterResponseDto {
  final String message;
  final String token;
  final UserDto user;

  RegisterResponseDto({
    required this.message,
    required this.token,
    required this.user,
  });

  factory RegisterResponseDto.fromJson(Map<String, dynamic> json) {
    return RegisterResponseDto(
      message: json["message"] ?? "",
      token: json["token"] ?? "",
      user: UserDto.fromJson(json["user"]),
    );
  }
}
