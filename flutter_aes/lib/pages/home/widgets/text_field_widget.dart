// ignore_for_file: must_be_immutable

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_aes/src/text_string.dart';

class TextFieldWidget extends StatefulWidget {
  late bool obscure;
  late IconData iconTheme;
  late String labelText;
  late String hintText;
  late final Function(String) onChanged;
  TextFieldWidget(this.controller, this.iconTheme, this.labelText,
      this.hintText, this.onChanged,
      {Key? key})
      : super(key: key);

  TextEditingController controller = TextEditingController();

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  TextEditingController controller = TextEditingController();
  late bool obscure;
  late IconTheme iconTheme;
  late String labelText;
  late String hintText;
  late final Function(String) onChanged;

  String? _emptyValidator(val) {
    if (val != null) {
      if (val.trim().isEmpty) {
        return StringTextWidget.enterValueText;
      } else {
        return null;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textCapitalization: TextCapitalization.sentences,
      obscureText: obscure,
      decoration: _inputDecoraiton(),
      style: Theme.of(context).textTheme.subtitle1,
      onChanged: onChanged,
      validator: _emptyValidator,
    );
  }

  InputDecoration _inputDecoraiton() {
    return InputDecoration(
        icon: iconTheme,
        border: const OutlineInputBorder(),
        labelText: labelText,
        hintText: hintText);
  }
}
