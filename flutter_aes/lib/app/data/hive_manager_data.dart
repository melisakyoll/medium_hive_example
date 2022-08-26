import 'package:flutter/foundation.dart';
import 'package:flutter_aes/services/encyrpt_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveData {
  static const boxName = 'password';
  final Box box = Hive.box(boxName);

  Future<void> addTodo(
    String pass,
    String mail,
    String typ,
  ) async {
    final EncryptService encryptService = EncryptService();
    pass = encryptService.encrypt(pass);
    var value = {'type': typ, 'email': mail, 'password': pass};
    box.add(value);
  }

  /*Future getTodo() async {
    //return box.get(id);
  }*/

  Future<void> saveTodo() async {
    //await todo.save();
  }

  Future<void> deleteTodo() async {
    //await todo.delete();
  }

  ValueListenable<Box> listenTodo() {
    return Hive.box(boxName).listenable();
  }
}
