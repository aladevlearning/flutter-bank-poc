import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bank/common/singletextitem.dart';
import 'package:flutter_bank/products/product.dart';
import 'package:flutter_bank/products/service.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final ProductService service = ProductService();

  late Future<List<Product>> itemsFuture;

  @override
  void initState() {
    super.initState();
    itemsFuture = service
        .fetchProducts(); /* List<Product>.generate(
      30,
      (count) => Product(
          name: "Account $count",
          balance: Random.secure().nextInt(90000) / 100 + 500)); */
  }

  ListView getProductList(List<Product> products) {
    return ListView.builder(
      itemBuilder: (context, index) {
        var product = products[index];
        return ListTile(
          title: SingleTextItem(
              label: product.name, value: product.balance.toString()),
          onTap: () {},
        );
      },
      itemCount: products.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Products"),
        ),
        body: Center(
          child: //getProductList(),
              FutureBuilder<List<Product>>(
            future: itemsFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return getProductList(snapshot.data!);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              return const CircularProgressIndicator();
            },
          ),
        ));
  }
}
