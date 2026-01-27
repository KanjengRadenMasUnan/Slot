import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  // Pastikan URL dasar sesuai
  static const String baseUrlLogin = "http://localhost/slot-api/login.php";
  static const String baseUrlRegister =
      "http://localhost/slot-api/register.php";

  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrlLogin),
        body: {'username': username, 'password': password},
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {"status": "error", "message": "Server Error"};
      }
    } catch (e) {
      return {"status": "error", "message": e.toString()};
    }
  }

  Future<Map<String, dynamic>> register(
    String username,
    String password,
  ) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrlRegister),
        body: {'username': username, 'password': password},
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {"status": "error", "message": "Server Error"};
      }
    } catch (e) {
      return {"status": "error", "message": e.toString()};
    }
  }
}
