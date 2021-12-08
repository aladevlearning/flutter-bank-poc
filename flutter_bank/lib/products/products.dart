import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bank/common/singletextitem.dart';
import 'package:flutter_bank/products/product.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  var items = List<Product>.generate(
      30,
      (count) => Product(
          name: "Account $count",
          balance: Random.secure().nextInt(90000) / 100 + 500));

  ListView getProductList() {
    return ListView.builder(itemBuilder: (context, index) {
      var item = items[index];
      return ListTile(
        title: SingleTextItem(label: item.name, value: item.balance.toString()),
        onTap: () {},
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: getProductList(),
    );
  }
}
