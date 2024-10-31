import 'package:dosty_theme/dosty_theme.dart';

class MyColor {
  Map myColor(List<DostyColor> myColors) {
    Map colors = {};
    for (var element in myColors) {
      colors[element.name] = element.toMap();
    }
    return colors;
  }
}
