// ignore_for_file: unused_field, prefer_typing_uninitialized_variables, prefer_final_fields

import 'package:dosty_theme/dosty_theme.dart';
import 'package:dosty_theme_annotation/dosty_theme_annotation.dart';
import 'package:flutter/material.dart';
part 'my_theme.g.dart';

List<DostyColor> dataColor = [
  const DostyColor(name: 'color1', light: Colors.white, dark: Colors.black),
  const DostyColor(name: 'color2', light: Colors.black, dark: Colors.white),
  const DostyColor(name: 'color3', light: Colors.amber, dark: Colors.red),
  const DostyColor(name: 'color4', light: Colors.amber, dark: Colors.red),
  const DostyColor(name: 'grey2', light: Colors.grey, dark: Colors.blueGrey),
  const DostyColor(
      name: 'grey3', light: Colors.grey, dark: Color.fromARGB(255, 3, 43, 63)),
];

@DostyTheme(vars: [
  'color1',
  'color2',
  'color3',
  'color4',
  'grey2',
  'grey3',
])
class Mytheme extends _$Mytheme {
  Mytheme() : super(myColors: dataColor, mode: ThemeMode.system);
}
