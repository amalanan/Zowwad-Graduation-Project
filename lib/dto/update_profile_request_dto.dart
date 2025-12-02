import 'dart:io';

class UpdateProfileRequestDto {
  final String name;
  final String email;
  final String phoneNumber;
  final String? universityId;
  final String university;
  final String department;
  final String role;
  final String? nationalId;
  final File? image;

  UpdateProfileRequestDto({
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.universityId,
    required this.university,
    required this.department,
    required this.role,
    this.nationalId,
    this.image,
  });
}
