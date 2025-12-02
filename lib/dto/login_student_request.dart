class LoginStudentRequestDto {
   String universityId;
   String password;

  LoginStudentRequestDto({
    required this.universityId,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    "university_id": universityId,
    "password": password,
  };
}
