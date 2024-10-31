import 'package:dosty_theme/dosty_theme.dart';

class DostyTool {
  static Map<String, Map<String, int>> myColorTool(List<DostyColor> colors) {
    Map<String, Map<String, int>> data = {};
    for (var e in colors) {
      data[e.name] = {
        'light': e.light.value,
        'dark': e.dark.value,
      };
    }
    return data;
  }
}
