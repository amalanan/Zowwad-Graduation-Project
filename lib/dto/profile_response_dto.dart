class ProfileResponseDto {
  final String msg;
  final int id;
  final String name;
  final String email;
  final String phoneNumber;
  final String role;
  final String? universityId;
  final String? nationalId;
  final String university;
  final String department;
  final String? image;

  ProfileResponseDto({
    required this.msg,
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.role,
    this.universityId,
    this.nationalId,
    required this.university,
    required this.department,
    this.image,
  });

  factory ProfileResponseDto.fromJson(Map<String, dynamic> json) {
    final user = json['user']; // nested object
    return ProfileResponseDto(
      msg: json['msg'],
      id: user['id'],
      name: user['name'],
      email: user['email'],
      phoneNumber: user['phone_number'],
      role: user['role'],
      universityId: user['university_id']?.toString(),
      nationalId: user['national_id'],
      university: user['university'],
      department: user['department'],
      image: user['image'],
    );
  }

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "user": {
      "id": id,
      "name": name,
      "email": email,
      "phone_number": phoneNumber,
      "role": role,
      "university_id": universityId,
      "national_id": nationalId,
      "university": university,
      "department": department,
      "image": image,
    }
  };
}
