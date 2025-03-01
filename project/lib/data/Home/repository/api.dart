import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project/data/Home/models/home.dart';

class HomeServices {
  Future fetchHome() async {
    final url = Uri.parse('https://fakestoreapi.com/products');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data.map<Home>((json) => Home.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
