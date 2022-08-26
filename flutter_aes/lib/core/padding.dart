// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, must_be_immutable

import 'package:flutter/cupertino.dart';

class PaddingWidget extends Padding {
  PaddingWidget({Key? key, required super.padding}) : super(key: key);

  static EdgeInsets horzonVertical =
      EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0);

  static EdgeInsets randomHorizonVertical =
      EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0);

  static EdgeInsets bottomNavPadding =
      EdgeInsets.symmetric(horizontal: 50.0, vertical: 13.0);
}
