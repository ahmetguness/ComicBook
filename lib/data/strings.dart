import 'package:flutter/foundation.dart';

class Strings {
  Strings() {
    if (kDebugMode) {
      print('Done');
    }
  }

  // ignore: constant_identifier_names
  static const String app_name = "Comic Book";

  static const List<String> categories = [
    "spider-man",
    "batman",
    "thor",
    "hulk",
    "witcher",
    "wolverine"
  ];
}