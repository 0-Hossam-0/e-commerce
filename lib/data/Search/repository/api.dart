import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project/data/Search/models/search.dart';

class SearchServices {
  Future fetchSearch(String search) async {
    final url = Uri.parse('https://dummyjson.com/products');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> productsJson = data['products'];
      return productsJson.map((json) => Search.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
