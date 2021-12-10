import 'dart:convert';

import 'package:flutter_bank/products/product.dart';
import 'package:flutter_bank/products/productlist.dart';
import 'package:http/http.dart' as http;

class ProductService {
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(
        'https://my-json-server.typicode.com/jkauppin/demo/products'));
    if (response.statusCode == 200) {
      return ProductList.fromJson(jsonDecode(response.body)).list;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
