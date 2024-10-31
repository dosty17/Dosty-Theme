library dosty_theme_generator;

import 'package:build/build.dart';
import 'package:dosty_theme_generator/src/json_generator.dart';

import 'package:source_gen/source_gen.dart';

Builder dostyThemeGenerate(BuilderOptions options) {
  return SharedPartBuilder(
    [DostyGenerator()],
    'dosty_theme_generator',
  );
}
