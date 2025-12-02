class UserDto {
  final int id;
  final String name;
  final String email;
  final String university;
  final String nationalId;
  final String universityId;
  final String phoneNumber;
  final String address;
  final String department;
  final int isVerified;
  final String? emailVerifiedAt;
  final String role;
  final String createdAt;

  UserDto({
    required this.id,
    required this.name,
    required this.email,
    required this.university,
    required this.nationalId,
    required this.universityId,
    required this.phoneNumber,
    required this.address,
    required this.department,
    required this.isVerified,
    required this.emailVerifiedAt,
    required this.role,
    required this.createdAt,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      university: json["university"],
      nationalId: json["national_id"] ?? "",
      universityId: json["university_id"] ?? "",
      phoneNumber: json["phone_number"] ?? "",
      address: json["address"] ?? "",
      department: json["department"] ?? "",
      isVerified: json["is_verified"] ?? 0,
      emailVerifiedAt: json["email_verified_at"],
      role: json["role"],
      createdAt: json["created_at"],
    );
  }
}
