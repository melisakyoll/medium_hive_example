// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_aes/core/base/state/base_widget.dart';
import 'package:flutter_aes/core/constant/color_constant.dart';
import 'package:flutter_aes/core/padding.dart';
import 'package:flutter_aes/src/text_string.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FloatingActionButtonWidget extends StatefulWidget {
  const FloatingActionButtonWidget({Key? key}) : super(key: key);

  @override
  State<FloatingActionButtonWidget> createState() =>
      _FloatingActionButtonWidgetState();
}

class _FloatingActionButtonWidgetState
    extends State<FloatingActionButtonWidget> {
  final servicecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
      backgroundColor: primary,
      onPressed: insertHiveDB,
      child: const Icon(Icons.add, color: whiteColor),
    );
  }

  void insertHiveDB() {
    String? type;
    String? email;
    String? password;

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    StringTextWidget.upperText,
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    controller: servicecontroller,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                        icon: const Icon(FontAwesomeIcons.google),
                        border: const OutlineInputBorder(),
                        labelText: StringTextWidget.serviceText,
                        hintText: StringTextWidget.googleText),
                    style: Theme.of(context).textTheme.subtitle1,
                    onChanged: (value) => type = value,
                    validator: (val) {
                      if (val!.trim().isEmpty) {
                        return StringTextWidget.enterValueText;
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 15.0),
                  TextFormField(
                    controller: emailcontroller,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        size: 26,
                      ),
                      border: OutlineInputBorder(),
                      labelText: StringTextWidget.usernameText,
                    ),
                    style: GoogleFonts.getFont('Inter', fontSize: 18),
                    onChanged: (value) => email = value,
                    validator: (val) {
                      if (val!.trim().isEmpty) {
                        return StringTextWidget.enterValueText;
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 15.0),
                  TextFormField(
                    controller: passwordcontroller,
                    textCapitalization: TextCapitalization.sentences,
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.password,
                      ),
                      border: OutlineInputBorder(),
                      labelText: StringTextWidget.labelText,
                    ),
                    style: GoogleFonts.getFont('Inter', fontSize: 18),
                    onChanged: (value) => password = value,
                    validator: (val) {
                      if (val!.trim().isEmpty) {
                        return StringTextWidget.enterValueText;
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 15.0),
                  ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  horizontal: 50.0, vertical: 13.0)),
                          backgroundColor: MaterialStateProperty.all(
                            primary,
                          )),
                      child: Text(StringTextWidget.saveText,
                          style: Theme.of(context).textTheme.subtitle1),
                      onPressed: () {
                        final base = BaseWidget.of(context);
                        base.dataStore.addPassword(password!, email!, type!);
                        Navigator.pop(context);
                        setState(() {});
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton elevatedButtonWidget(
      String password, String type, String email, BuildContext context) {
    final base = BaseWidget.of(context);
    return ElevatedButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(PaddingWidget.bottomNavPadding),
            backgroundColor: MaterialStateProperty.all(
              primary,
            )),
        child: Text(StringTextWidget.saveText,
            style: Theme.of(context).textTheme.headline4),
        onPressed: () {
          base.dataStore.addPassword(password, email, type);
          Navigator.pop(context);
          setState(() {});
        });
  }
}
