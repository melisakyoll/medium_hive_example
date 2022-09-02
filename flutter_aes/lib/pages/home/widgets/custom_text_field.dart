// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  late bool obscure;
  late IconTheme iconTheme;
  late String labelText;
  late String hintText;
  final Function(String) onChanged;
  CustomTextField({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          icon: iconTheme,
          border: const OutlineInputBorder(),
          labelText: labelText,
          hintText: hintText),
    );
  }
}
