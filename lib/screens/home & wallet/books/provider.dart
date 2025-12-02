import 'package:Zowwad/api/app_service.dart';
import 'package:flutter/material.dart';
import 'package:Zowwad/dto/FacultyBook/book_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BooksProvider extends ChangeNotifier {
  int selectedTabIndex = 0;

  List<BookDto> _allBooks = [];
  List<BookDto> _borrowedBooks = [];
  List<BookDto> _availableBooks = [];

  List<BookDto> _currentBooks = [];
  bool _isLoading = false;

  List<BookDto> get bookList => _currentBooks;
  bool get isLoading => _isLoading;

  int? _lastOpenedBookId;
  int? get lastOpenedBookId => _lastOpenedBookId;

  final List<Map<String, dynamic>> orderTabs = [
    {"label": "المتبقية"},
    {"label": "تمت إعارتها"},
    {"label": "الكل"},
  ];

  BooksProvider() {
    fetchInitialBooks();
    loadLastBook(); // ← تحميل آخر كتاب عند تشغيل التطبيق
  }

  // ---------------------------
  // 🔥 تحميل الكتب الأساسية
  // ---------------------------
  Future<void> fetchInitialBooks() async {
    _isLoading = true;
    notifyListeners();

    try {
      _allBooks = await AppService().getMyBooks();
      _availableBooks = await AppService().getAvailableBooks();
      _borrowedBooks = await AppService().getBorrowedBooks();

      _currentBooks = _availableBooks; // Default
    } catch (e) {
      print("Error loading books: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // ---------------------------
  // 🔥 Tabs switching
  // ---------------------------
  Future<void> selectTab(int index) async {
    selectedTabIndex = index;
    _isLoading = true;
    notifyListeners();

    try {
      if (index == 0) {
        _currentBooks = await AppService().getAvailableBooks();
      } else if (index == 1) {
        _borrowedBooks = await AppService().getBorrowedBooks();
        _currentBooks = _borrowedBooks;
      } else {
        _currentBooks = await AppService().getMyBooks();
      }
    } catch (e) {
      print("Error selecting tab: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // ---------------------------
  // ⭐ تخزين آخر كتاب فتحته
  // ---------------------------
  Future<void> saveLastBook(int id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("last_book_id", id);
    _lastOpenedBookId = id;
  }

  // ---------------------------
  // ⭐ تحميل آخر كتاب فتحته
  // ---------------------------
  Future<void> loadLastBook() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey("last_book_id")) return;

    _lastOpenedBookId = prefs.getInt("last_book_id");
  }

  // ---------------------------
  // ⭐ فتح آخر كتاب فُتح
  // ---------------------------
  Future<bool> openLastBook() async {
    final prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey("last_book_id")) return false;

    final id = prefs.getInt("last_book_id");
    if (id == null) return false;

    _lastOpenedBookId = id;
    return true;
  }

  // ---------------------------
  // ⭐ عند فتح تفاصيل كتاب
  // ---------------------------
  void setCurrentBook(int id) {
    saveLastBook(id); // نحفظه تلقائياً
    _lastOpenedBookId = id;
    notifyListeners();
  }
}
