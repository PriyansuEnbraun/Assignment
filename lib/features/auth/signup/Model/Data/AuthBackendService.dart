import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class AuthBackendService {
  
  static String get baseUrl {

      return "http://10.0.2.2:5000/users";

    }

  // Signup 
  Future<String> signup(String fullName, String loginId, String password) async {
    final url = Uri.parse('$baseUrl/SignUp');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'FullName': fullName,
          'LoginId': loginId,
          'password': password,
        }),
      );

      if (response.statusCode == 201) {
        return "User created successfully";
      } else {
        return "Error: ${response.statusCode} - ${response.reasonPhrase}";
      }
    } catch (e) {
      return 'Error: $e';
    }
  }

  // Login method
  Future<bool?> login(String loginId, String password) async {
    final url = Uri.parse('$baseUrl/Login');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'LoginId': loginId,
          'password': password,
        }),
      );

      if (response.statusCode == 201) {
        final data = json.decode(response.body)['token'];
        final token = data.toString();
        log(token);
        return true;
      } else {
        log(response.statusCode.toString());
        return false;
      }
    }
    catch (e) {
      log("Error $e");
      return false;
    }
  }
}
