import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginServices {
  Future fetchLogin(String username, String password) async {
    final url = Uri.parse('https://fakestoreapi.com/auth/login');
    final response = await http.post(url, body: {
      'username': username,
      'password': password,
    });
    if (response.statusCode == 200) {
      final token = json.decode(response.body)['token'];
      return token;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
