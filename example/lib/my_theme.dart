// ignore_for_file: unused_field, prefer_typing_uninitialized_variables, prefer_final_fields

import 'package:dosty_theme/dosty_theme.dart';
import 'package:dosty_theme_annotation/dosty_theme_annotation.dart';
import 'package:flutter/material.dart';
part 'my_theme.g.dart';

List<DostyColor> data = [
  DostyColor(name: 'color1', light: Colors.white, dark: Colors.black),
  DostyColor(name: 'color2', light: Colors.black, dark: Colors.white),
  DostyColor(name: 'color3', light: Colors.amber, dark: Colors.red),
  DostyColor(name: 'color4', light: Colors.amber, dark: Colors.red),
  DostyColor(name: 'grey2', light: Colors.grey, dark: Colors.blueGrey),
  DostyColor(name: 'grey3', light: Colors.grey, dark: Colors.blueGrey),
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
  Mytheme() : super(myColors: data, mode: ThemeMode.dark);
}
