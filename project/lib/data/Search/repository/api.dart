import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project/data/Search/models/search.dart';

class SearchServices {
  Future fetchSearch(String search) async {
    final url = Uri.parse('https://fakestoreapi.com/products');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(search);
      final data = json.decode(response.body);
      final List<Search> products =
          data.map<Search>((json) => Search.fromJson(json)).toList();
      return products
          .where((product) =>
              product.title.toLowerCase().contains(search.toLowerCase()))
          .toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
