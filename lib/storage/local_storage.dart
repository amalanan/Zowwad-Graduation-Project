import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  /// Save token
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
  }

  /// Get token
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  /// Remove token (logout)
  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("token");
  }
}
