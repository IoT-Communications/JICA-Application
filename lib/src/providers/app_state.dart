import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:jica/src/utils/constants/const.dart';

class AppState extends ChangeNotifier {
  Box box = Hive.box(kSession);
  String token;

  AppState() {
    token = box.get(kToken);
  }

  void updateHiveDB() async {
    if (!box.isOpen) {
      await Hive.openBox(kSession);
    }
    box.put(kToken, token);
  }

  void logout() {
    box.clear();
  }
}
