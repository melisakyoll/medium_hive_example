// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class StringTextWidget extends Text {
  StringTextWidget(super.data, {Key? key}) : super(key: key);

  //Encrypt Service Page
  static String keyUtf8 = 'WlFsdCYyJPPmKAVeA9ir+A==';
  static String copyMessage = 'Kopyalandı';

//Password Generator
  static String generateTitle = 'Parola Üretme ';
  static String labelText = 'Parola';

//Home Page
  static String appBarTitle = 'Parolalarınız';
  static String appBarIconTitle = 'Tüm Parolalar';
  static String noPassText = 'Parola Kaydedilmemiş';
  static String serviceText = 'Servis';
  static String enterValueText = 'Bir Değer Giriniz';
  static String usernameText = 'Kullanıcı Adı';

//Servis Adları
  static String googleText = 'Google';
  static String facebookText = 'Facebook';
  static String instagramTekxt = 'Instagram';
  static String snapchatText = 'Snapchat';
  static String twitterTekxt = 'Twitter';
  static String dcText = 'Discord';

  static String pleaseAuth = 'Lütfen Parolanızı Giriniz';

  static String saveText = 'Kaydet';
  static String deleteText = 'Sil';
  static String copyText = 'Kopyala';

  static String upperText = 'Lütfen servis adının ilk harfini büyük yazınız!';

  static String serviceTextUpper = 'SERVİS';
  static String passTextUpper = 'PAROLA';
  static String usernameTextUpper = 'KULLANICI ADI';

  static String isDelete = 'Silinsin mi?';
}
