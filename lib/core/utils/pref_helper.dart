import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  static String tokenkey = 'token';

  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString(tokenkey, token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.get(tokenkey);
    return null;
  }

  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.remove(tokenkey);
  }
}
