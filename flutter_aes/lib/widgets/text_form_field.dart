// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  IconData? icon;
  String? labelText;
  String? hintText;
  TextFormFieldWidget({this.hintText, this.icon, this.labelText, super.key});

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  TextEditingController controller = TextEditingController();
  IconData? icon;
  String? labelText;
  String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          icon: Icon(icon),
          border: const OutlineInputBorder(),
          labelText: labelText,
          hintText: hintText),
    );
  }
}
