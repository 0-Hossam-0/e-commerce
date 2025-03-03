import 'package:http/http.dart' as http;

class SignUpServices {
  Future fetchSignUp(String email,String username, String password) async {
    final url = Uri.parse('https://fakestoreapi.com/users');
    final response = await http.post(url, body: {
      'username': username,
      'email': email,
      'password': password,
    });
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
