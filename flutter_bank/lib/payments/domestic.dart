import 'package:flutter/material.dart';

class DomesticPage extends StatefulWidget {
  const DomesticPage({Key? key}) : super(key: key);

  @override
  State<DomesticPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<DomesticPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Domestic Payments"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Domestic Form',
            ),
          ],
        ),
      ),
    );
  }
}
