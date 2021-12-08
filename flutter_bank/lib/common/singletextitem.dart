import 'package:flutter/material.dart';

class SingleTextItem extends StatelessWidget {
  const SingleTextItem({this.key, this.label, this.value}) : super(key: key);

  final Key? key;
  final String? label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Text(
        label ?? "",
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      Align(
        alignment: Alignment.centerRight,
        child: Text(
          value ?? "",
          textAlign: TextAlign.right,
        ),
      ),
    ]);
  }
}
