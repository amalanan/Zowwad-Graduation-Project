import 'package:Zowwad/api/app_service.dart';
import 'package:Zowwad/dto/FacultyBook/book_dto.dart';
import 'package:Zowwad/dto/FacultyBook/faculty_dto.dart';
import 'package:Zowwad/dto/FacultyBook/faculty_filter_request_dto.dart';
import 'package:Zowwad/dto/FacultyBook/search_book_request_dto.dart';
import 'package:Zowwad/dto/FacultyBook/single_book_dto.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class BookProvider with ChangeNotifier {
  bool _showItems = true;
  int selectedCategoryIndex = -1;
  TextEditingController homeController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  final List<Map<String, dynamic>> reviews = [
    {
      'date': "20/12/2020",
      'image': Image.asset(person, fit: BoxFit.cover),
      'opinion':
      "قد تمكنت من استعارة كتاب البرمجة بلغة جافا 1 من قسم تكنولوجيا المعلومات و تم ذلك بكل سهولة, لقد تواصلت مع المالك عن طريق معلومات الاتصال الخاصة به و أتمنى أن أستفيد منه شكرأَ لجهودكم",
    },
    {
      'date': "20/12/2020",
      'image': Image.asset(person, fit: BoxFit.cover),
      'opinion':
      "قد تمكنت من استعارة كتاب البرمجة بلغة جافا 1 من قسم تكنولوجيا المعلومات و تم ذلك بكل سهولة, لقد تواصلت مع المالك عن طريق معلومات الاتصال الخاصة به و أتمنى أن أستفيد منه شكرأَ لجهودكم",
    },
    {
      'date': "20/12/2020",
      'image': Image.asset(person, fit: BoxFit.cover),
      'opinion':
      "قد تمكنت من استعارة كتاب البرمجة بلغة جافا 1 من قسم تكنولوجيا المعلومات و تم ذلك بكل سهولة, لقد تواصلت مع المالك عن طريق معلومات الاتصال الخاصة به و أتمنى أن أستفيد منه شكرأَ لجهودكم",
    },
    {
      'date': "20/12/2020",
      'image': Image.asset(person, fit: BoxFit.cover),
      'opinion':
      "قد تمكنت من استعارة كتاب البرمجة بلغة جافا 1 من قسم تكنولوجيا المعلومات و تم ذلك بكل سهولة, لقد تواصلت مع المالك عن طريق معلومات الاتصال الخاصة به و أتمنى أن أستفيد منه شكرأَ لجهودكم",
    },
    {
      'date': "20/12/2020",
      'image': Image.asset(person, fit: BoxFit.cover),
      'opinion':
      "قد تمكنت من استعارة كتاب البرمجة بلغة جافا 1 من قسم تكنولوجيا المعلومات و تم ذلك بكل سهولة, لقد تواصلت مع المالك عن طريق معلومات الاتصال الخاصة به و أتمنى أن أستفيد منه شكرأَ لجهودكم",
    },
    {
      'date': "20/12/2020",
      'image': Image.asset(person, fit: BoxFit.cover),
      'opinion':
      "قد تمكنت من استعارة كتاب البرمجة بلغة جافا 1 من قسم تكنولوجيا المعلومات و تم ذلك بكل سهولة, لقد تواصلت مع المالك عن طريق معلومات الاتصال الخاصة به و أتمنى أن أستفيد منه شكرأَ لجهودكم",
    },
  ];


  bool get showItems => _showItems;

  void showAllItems() {
    _showItems = true;
    notifyListeners();
  }

  void showReviews() {
    _showItems = false;
    notifyListeners();
  }

  /// Faculties list starts with "All Books"
  List<FacultyDto> faculties = [FacultyDto(id: -1, name: "كل الكتب")];
  bool isLoadingFaculties = false;
  final AppService _appService = AppService();

  /// Load faculties but keep "كل الكتب" at the top
  Future<void> loadFaculties() async {
    print("start load");
    try {
      isLoadingFaculties = true;
      notifyListeners();

      final fetchedFaculties = await _appService.getFaculties();

      faculties = [
        FacultyDto(id: -1, name: "كل الكتب"),
        ...fetchedFaculties,
      ]; // append faculties after "All Books" option
    } catch (e) {
      print("Failed to load faculties: $e");
      faculties = [FacultyDto(id: -1, name: "كل الكتب")]; // fallback
    } finally {
      isLoadingFaculties = false;
      notifyListeners();
    }
  }

  /// Handle faculty selection
  void selectFaculty(int index) async {
    selectedCategoryIndex = index;
    notifyListeners(); // UI update

    final selectedFacultyId = faculties[index].id;
    await loadBooksForFaculty(selectedFacultyId);
  }

  List<BookDto> selectedFacultyBooks = [];
  bool isLoadingBooks = false;

  /// Load books for faculty or load ALL if ID == -1
  Future<void> loadBooksForFaculty(int facultyId) async {
    try {
      isLoadingBooks = true;
      notifyListeners();

      if (facultyId == -1) {
        // Load ALL books
        selectedFacultyBooks = await _appService.getAllBooksByFaculty();
      } else {
        // Load books for specific faculty
        selectedFacultyBooks = (await _appService.getFacultyBooks(facultyId)).books;
      }
    } catch (e) {
      print("Failed to load books: $e");
      selectedFacultyBooks = [];
    } finally {
      isLoadingBooks = false;
      notifyListeners();
    }
  }

  int? _selectedBookId;
  int get selectedBookId => _selectedBookId ?? 0;
  late SingleBookDto selectedBook;
  late BookDto selectedBookDto ;
  void selectBook(int bookId) {
    _selectedBookId = bookId;
    notifyListeners();
  }

  bool isLoadingSelectedBook = false;

  Future<void> loadBookDetails() async {
    try {
      isLoadingSelectedBook = true;
      notifyListeners();

      final bookDetails = await _appService.getBook(_selectedBookId!);
      selectedBookDto = selectedFacultyBooks.firstWhere((book) => book.id == selectedBookId);
      selectedBook = bookDetails;
    } catch (e) {
      print("Failed to load book details: $e");
    } finally {
      isLoadingSelectedBook = false;
      notifyListeners();
    }
  }

  /// Search books and faculties
  Future<void> filterBooks(String query) async {
    final text = query.trim().toLowerCase();

    if (text.isEmpty) {
      // Reload all everything
      await loadFaculties();
      await loadBooksForFaculty(faculties[selectedCategoryIndex].id);
    } else {
      try {
        final filterBooks = await _appService.searchBooks(
          BookSearchRequestDto(title: query),
        );
        selectedFacultyBooks = filterBooks.books;
      } catch (e) {
        selectedFacultyBooks = [];
      }

      try {
        final filterFaculties = await _appService.filterFaculties(
          FacultyFilterRequestDto(name: query),
        );
        faculties = [
          FacultyDto(id: -1, name: "كل الكتب"),
          ...filterFaculties.toFacultyDtoList(),
        ];
      } catch (e) {
        faculties = [FacultyDto(id: -1, name: "كل الكتب")];
      }
    }

    notifyListeners();
  }
}
