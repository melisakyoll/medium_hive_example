// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_aes/src/text_string.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldWidget extends StatefulWidget {
  TextFieldWidget({Key? key}) : super(key: key);

  TextEditingController controller = TextEditingController();

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  TextEditingController controller = TextEditingController();
  late bool obscure;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textCapitalization: TextCapitalization.sentences,
      obscureText: obscure,
      decoration: InputDecoration(
          icon: const Icon(FontAwesomeIcons.google),
          border: const OutlineInputBorder(),
          labelText: StringTextWidget.serviceText,
          hintText: StringTextWidget.googleText),
      style: GoogleFonts.getFont('Inter', fontSize: 18),
      //onChanged: () {},
    );
  }
}
