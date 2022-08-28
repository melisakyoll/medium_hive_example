import 'package:flutter/foundation.dart';
import 'package:flutter_aes/services/encyrpt_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveData {
  static const boxName = 'password';
  final Box box = Hive.box(boxName);

  Future<void> addPassword(
    String pass,
    String mail,
    String typ,
  ) async {
    final EncryptService encryptService = EncryptService();
    pass = encryptService.encrypt(pass);
    var value = {'type': typ, 'email': mail, 'password': pass};
    box.add(value);
  }

  Future<void> deletePassword(int index) async {
    await box.deleteAt(index);
  }

  ValueListenable<Box> listenPass() {
    return Hive.box(boxName).listenable();
  }
}
