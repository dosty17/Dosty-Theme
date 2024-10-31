import 'package:flutter/material.dart';

class DostyColor {
  late String name;
  late Color dark;
  late Color light;
  DostyColor({required this.name, required this.light, required this.dark});
  Map<String, Color> toMap() {
    return {
      'light': light,
      'dark': dark,
    };
  }
}
