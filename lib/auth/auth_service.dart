import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {

  static Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("auth_token");

    if (token != null) {
      await http.post(
        Uri.parse("https://www.an-d.asia/ajax/logout.php"),
        body: {"token": token},
      );
    }

    await prefs.remove("auth_token");
  }
}