import 'package:Zowwad/dto/FacultyBook/book_dto.dart';
import 'package:Zowwad/dto/FacultyBook/create_book_dto.dart';
import 'package:Zowwad/dto/FacultyBook/faculty_books_response_dto.dart';
import 'package:Zowwad/dto/FacultyBook/faculty_dto.dart';
import 'package:Zowwad/dto/FacultyBook/faculty_filter_request_dto.dart';
import 'package:Zowwad/dto/FacultyBook/faculty_filter_response_dto.dart';
import 'package:Zowwad/dto/FacultyBook/faculty_response_dto.dart';
import 'package:Zowwad/dto/FacultyBook/faculty_with_books_dto.dart';
import 'package:Zowwad/dto/FacultyBook/search_book_request_dto.dart';
import 'package:Zowwad/dto/FacultyBook/search_book_response.dart';
import 'package:Zowwad/dto/FacultyBook/single_book_dto.dart';
import 'package:Zowwad/dto/profile_response_dto.dart';
import 'package:Zowwad/dto/register_response.dart';
import 'package:Zowwad/dto/update_profile_request_dto.dart';
import 'package:dio/dio.dart';
import '../storage/local_storage.dart';
import 'api_client.dart';
import '../dto/login_student_request.dart';
import '../dto/login_graduate_request.dart';
import '../dto/login_response.dart';
import '../dto/register_request.dart';


class AppService {

  // STUDENT LOGIN
  Future<LoginResponseDto> loginStudent(LoginStudentRequestDto dto) async {
    try {
      final response = await ApiClient.dio.post(
        "/login/student",
        data: dto.toJson(),
      );

      final loginData = LoginResponseDto.fromJson(response.data);

      // Save token
      await LocalStorage.saveToken(loginData.token);

      return loginData;

    } on DioException catch (e) {
      throw Exception(e.response?.data["message"] ?? "Login failed");
    }
  }

  // GRADUATE LOGIN
  Future<LoginResponseDto> loginGraduate(LoginGraduateRequestDto dto) async {
    try {
      final response = await ApiClient.dio.post(
        "/login/graduate",
        data: dto.toJson(),
      );

      final loginData = LoginResponseDto.fromJson(response.data);

      // Save token
      await LocalStorage.saveToken(loginData.token);

      return loginData;

    } on DioException catch (e) {
      throw Exception(e.response?.data["message"] ?? "Login failed");
    }
  }

  // REGISTER
  Future<RegisterResponseDto> register(RegisterRequestDto dto) async {
    try {
      print(dto.toJson());
      final response = await ApiClient.dio.post(
        "/register",
        data: dto.toJson(),
      );

      final registerData = RegisterResponseDto.fromJson(response.data);

      // Save token
      await LocalStorage.saveToken(registerData.token);

      return registerData;

    } on DioException catch (e) {
      // Full API error object
      final data = e.response?.data;

      if (data != null) {
        // extract message
        final msg = data["message"] ?? "Register failed";

        // extract errors if exist
        if (data["errors"] != null) {
          final Map<String, dynamic> errs = data["errors"];

          // Convert all array errors into one readable string
          final allErrors = errs.values
              .expand((value) => value) // flatten lists
              .join("\n"); // join lines

          throw Exception(allErrors); // return clean text to UI
        }

        throw Exception(msg);
      }

      throw Exception("Register failed");
    }
  }

  // GET Faculties
  Future<List<FacultyDto>> getFaculties() async {
    try {
      final response = await ApiClient.dio.get("/faculties");

      final data = FacultyResponseDto.fromJson(response.data);
      return data.faculties;
    } on DioException catch (e) {
      throw Exception(e.response?.data["message"] ?? "Failed to load faculties");
    }
  }
  // GET Faculty with Books
  Future<FacultyWithBooksDto> getFacultyBooks(int id) async {
    try {
      final response = await ApiClient.dio.get("/faculties/$id");

      final data = FacultyBooksResponseDto.fromJson(response.data);
      return data.faculty;
    } on DioException catch (e) {
      throw Exception(e.response?.data["message"] ?? "Failed to load faculty books");
    }
  }
  // GET Book by ID
  Future<SingleBookDto> getBook(int id) async {
    try {
      final response = await ApiClient.dio.get("/book/$id");

      return SingleBookDto.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data["message"] ?? "Failed to load book");
    }
  }
  // SEARCH Books
  Future<SearchBooksResponse> searchBooks(BookSearchRequestDto dto) async {
    try {
      final response = await ApiClient.dio.get(
        "/books/search",
        queryParameters: dto.toJson(),
      );

      return SearchBooksResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data["message"] ?? "Search failed");
    }
  }
  // FILTER Faculties by Name
  Future<FacultyFilterResponseDto> filterFaculties(FacultyFilterRequestDto dto) async {
    try {
      final response = await ApiClient.dio.get(
        "/filter",
        queryParameters: dto.toJson(),
      );

      return FacultyFilterResponseDto.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data["message"] ?? "Filter failed");
    }
  }
  Future<List<BookDto>> getAllBooksByFaculty() async {
    try {
      final response = await ApiClient.dio.get(
        '/books/faculties',
      );
      if (response.statusCode == 200) {
        final data = response.data['data'] as Map<String, dynamic>;

        List<BookDto> allBooks = [];

        data.forEach((key, value) {
          // 'value' is a List<dynamic>
          final books = (value as List<dynamic>).map((bookJson) {
            return BookDto.fromJson(bookJson);
          }).toList();

          allBooks.addAll(books);
        });

        return allBooks;
      } else {
        throw Exception("Failed to load books by faculty");
      }
    } catch (e) {
      print("Error in getAllBooksByFaculty: $e");
      rethrow;
    }
  }

  // CREATE Book (with file upload)
  // CREATE Book (with file upload)
  Future<void> createBook(CreateBookRequestDto dto) async {
    try {
      final Map<String, dynamic> formFields = {
        'title': dto.title,
        'condition': dto.condition,
        'status': dto.status,
        'name': dto.name, // faculty name
      };

      if (dto.image != null) {
        formFields['image'] = await MultipartFile.fromFile(
          dto.image!.path,
          filename: dto.image!.path.split('/').last,
        );
      }

      if (dto.coverImage != null) {
        formFields['cover_image'] = await MultipartFile.fromFile(
          dto.coverImage!.path,
          filename: dto.coverImage!.path.split('/').last,
        );
      }

      final formData = FormData.fromMap(formFields);

      final response = await ApiClient.dio.post(
        "/book",
        data: formData,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Book created successfully");
      } else {
        throw Exception("Unexpected error: ${response.statusCode}");
      }
    } on DioException catch (e) {
      print("Create book error: ${e.response?.data}");
      throw Exception(e.response?.data["message"] ?? "Failed to create book");
    }
  }
  Future<ProfileResponseDto> getProfile() async {
    try {
      final response = await ApiClient.dio.get("/profile");
      final profile = ProfileResponseDto.fromJson(response.data);
      return profile ;
    } catch (e) {
      throw Exception("Failed to load profile");
    }
  }
  // UPDATE Profile
  Future<void> updateProfile(UpdateProfileRequestDto dto) async {
    try {
      final formData = FormData.fromMap({
        'name': dto.name,
        'email': dto.email,
        'phone_number': dto.phoneNumber,
        'university_id': dto.universityId ?? '',
        'university': dto.university,
        'department': dto.department,
        'role': dto.role,
        'national_id': dto.nationalId,
        if (dto.image != null)
          'image': await MultipartFile.fromFile(
            dto.image!.path,
            filename: dto.image!.path.split('/').last,
          ),
      });

      final response = await ApiClient.dio.post(
        '/profile/update',
        data: formData,
      );

      if (response.statusCode == 200) {
        print("Profile updated successfully");
      } else {
        throw Exception("Unexpected response: ${response.statusCode}");
      }
    } on DioException catch (e) {
      print("Update profile error: ${e.response?.data}");
      throw Exception(e.response?.data["message"] ?? "Failed to update profile");
    }
  }
// FORGOT PASSWORD
  Future<void> forgotPassword(String email) async {
    try {
      final response = await ApiClient.dio.post(
        "/forgot-password",
        data: {"email": email},
      );

      if (response.statusCode == 200) {
        print("Password reset link sent successfully");
      } else {
        throw Exception("Unexpected error: ${response.statusCode}");
      }
    } on DioException catch (e) {
      final data = e.response?.data;
      if (data != null && data["message"] != null) {
        throw Exception(data["message"]);
      }
      throw Exception("Failed to send password reset request");
    }
  }
  // GET My Books
  Future<List<BookDto>> getMyBooks() async {
    try {
      final response = await ApiClient.dio.get('/my-books');

      if (response.statusCode == 200 && response.data['success'] == true) {
        final List<dynamic> booksJson = response.data['books'];
        return booksJson
            .map((bookJson) => BookDto.fromJson(bookJson))
            .toList();
      } else {
        throw Exception("Failed to load your books");
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data["message"] ?? "Failed to load your books");
    }
  }
// GET Borrowed Books
  Future<List<BookDto>> getBorrowedBooks() async {
    try {
      final response = await ApiClient.dio.get('/my-books/borrowed');

      if (response.statusCode == 200 && response.data['success'] == true) {
        final List<dynamic> booksJson = response.data['books'];
        return booksJson
            .map((bookJson) => BookDto.fromJson(bookJson))
            .toList();
      } else {
        throw Exception("Failed to load borrowed books");
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data["message"] ?? "Failed to load borrowed books");
    }
  }
// GET Available Books
  Future<List<BookDto>> getAvailableBooks() async {
    try {
      final response = await ApiClient.dio.get('/my-books/available');

      if (response.statusCode == 200 && response.data['success'] == true) {
        final List<dynamic> booksJson = response.data['books'];
        return booksJson
            .map((bookJson) => BookDto.fromJson(bookJson))
            .toList();
      } else {
        throw Exception("Failed to load available books");
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data["message"] ?? "Failed to load available books");
    }
  }

  Future<void> verifyOtp(String email, String token) async {
    try {
      await ApiClient.dio.post("/verify-otp", data: {
        "email": email,
        "token": token,
      });
    } catch (e) {
      throw Exception("Failed to verify OTP");
    }
  }

  Future<void> resetPassword(String email, String token, String pass) async {
    try {
      await ApiClient.dio.post("/reset-password", data: {
        "email": email,
        "token": token,
        "password": pass,
        "password_confirmation": pass,
      });
    } catch (e) {
      throw Exception("Failed to reset password");
    }
  }





}
