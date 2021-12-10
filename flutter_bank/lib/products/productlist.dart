import 'package:flutter_bank/products/product.dart';

class ProductList {
  ProductList({required this.list});

  final List<Product> list;

  factory ProductList.fromJson(List<dynamic> productsJson) {
    //var products = json['products'] as List<dynamic>;
    var productList = <Product>[];
    for (var productJson in productsJson) {
      productList.add(Product.fromJson(productJson));
    }
    return ProductList(list: productList);
  }
}
