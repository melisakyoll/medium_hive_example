// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';

import 'package:encrypt/encrypt.dart' as ENCRYPT;
import 'package:flutter/services.dart';
import 'package:flutter_aes/constant/color_constant.dart';
import 'package:flutter_aes/src/text_string.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EncryptService {
  final iv = ENCRYPT.IV.fromLength(16);

  final encrypter =
      ENCRYPT.Encrypter(ENCRYPT.AES(ENCRYPT.Key.fromUtf8(keyUtf8)));

  String encrypt(String password) {
    final key = ENCRYPT.Key.fromUtf8(keyUtf8);
    final iv = ENCRYPT.IV.fromLength(16);

    final encrypter = ENCRYPT.Encrypter(ENCRYPT.AES(key));

    final encrypted = encrypter.encrypt(password, iv: iv);

    return encrypted.base64;
  }

  void copyToClipboard(String decryptedPassword, BuildContext context) {
    final decrypted = encrypter
        .decrypt(ENCRYPT.Encrypted.fromBase64(decryptedPassword), iv: iv);

    // copy to clipboard
    Clipboard.setData(ClipboardData(text: decrypted));

    Fluttertoast.showToast(
        msg: copyMessage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: toastColor.withOpacity(0.7),
        textColor: whiteColor,
        fontSize: 17);
  }
}
