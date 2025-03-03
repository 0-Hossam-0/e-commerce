import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project/data/Categories/models/categories.dart';

class CategoriesServices {
  Future fetchCategories(String category) async {
    final url = Uri.parse('https://fakestoreapi.com/products/category/$category');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data.map<Categories>((json) => Categories.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
