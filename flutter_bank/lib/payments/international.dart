import 'package:flutter/material.dart';

class InternationalPage extends StatefulWidget {
  const InternationalPage({Key? key}) : super(key: key);

  @override
  State<InternationalPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<InternationalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("International Payments"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'International Form',
            ),
          ],
        ),
      ),
    );
  }
}
