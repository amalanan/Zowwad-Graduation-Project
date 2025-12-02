class RegisterRequestDto {
  String name;
  String email;
  String password;
  String passwordConfirmation;
  String university;
  String role;
  String nationalId;
  String universityId;
  String phoneNumber;
  String address;
  String department;

  RegisterRequestDto({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.university,
    required this.role,
    required this.nationalId,
    required this.universityId,
    required this.phoneNumber,
    required this.address,
    required this.department,
  });

  /// EMPTY instance used during registration steps
  factory RegisterRequestDto.empty() {
    return RegisterRequestDto(
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      university: "",
      role: "",
      nationalId: "",
      universityId: "",
      phoneNumber: "",
      address: "",
      department: "",
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "password": password,
    "password_confirmation": passwordConfirmation,
    "university": university,
    "role": role,
    "national_id": nationalId,
    "university_id": universityId,
    "phone_number": phoneNumber,
    "address": address,
    "department": department,
  };
}
