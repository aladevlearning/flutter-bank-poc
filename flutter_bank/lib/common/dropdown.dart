import 'package:flutter/material.dart';

class DropdownItem extends StatelessWidget {
  const DropdownItem({this.key, this.label, this.values}) : super(key: key);

  final Key? key;
  final String? label;
  final List<String>? values;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: values?.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (_) {},
    );
  }
}
