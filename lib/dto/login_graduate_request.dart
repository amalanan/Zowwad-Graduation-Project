class LoginGraduateRequestDto {
   String nationalId;
   String password;

  LoginGraduateRequestDto({
    required this.nationalId,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    "national_id": nationalId,
    "password": password,
  };
}
