import 'user_dto.dart';

class LoginResponseDto {
  final String message;
  final UserDto user;
  final String token;

  LoginResponseDto({
    required this.message,
    required this.user,
    required this.token,
  });

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) {
    return LoginResponseDto(
      message: json["message"] ?? "",
      user: UserDto.fromJson(json["user"]),
      token: json["token"],
    );
  }
}
