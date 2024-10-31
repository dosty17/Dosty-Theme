import 'package:analyzer/dart/element/element.dart';
import 'package:dosty_theme_annotation/dosty_theme_annotation.dart';
import 'package:build/build.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:dosty_theme_generator/src/construct_theme.dart';
import 'package:dosty_theme_generator/src/model_visitor.dart';
import 'package:dosty_theme_generator/src/my_widget.dart';
import 'package:dosty_theme_generator/src/tool_theme.dart';
import 'package:source_gen/source_gen.dart';

class DostyGenerator extends GeneratorForAnnotation<DostyTheme> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final ModelVisitor visitor = ModelVisitor();
    element.visitChildren(visitor);

    final buffer = StringBuffer();

    buffer.writeln('// Custom code generated by: Dosty Pshtiwan');
    buffer
        .writeln('// ********************************************************');
    buffer.writeln('// This is a custom generator for handling theme colors');
    buffer.writeln('// Generated for: ${element.name}');
    buffer.writeln('');
    final className = element.name;

    List keys = visitor.fields.keys.toList();
    keys.remove('colors');
    keys.remove('isDark');
    keys = keys.where((element) => element.toString()[0] == '_').toList();

    buffer.writeln('class _\$$className {');
    buffer.writeln('bool isDark = false;');
    buffer.writeln(
        'List<ThemeMode> typeOfThemes = [ThemeMode.system, ThemeMode.light, ThemeMode.dark];');
    buffer.writeln('ThemeMode currentTheme = ThemeMode.system;');
    List vars = annotation
        .read('vars')
        .listValue
        .map((e) => e.toStringValue())
        .toList();
    if (vars.isNotEmpty) {
      vars.forEach((eC) {
        buffer.writeln("late Color ${eC.toString().replaceFirst('_', '')};");
      });
    } else {
      keys.forEach((eC) {
        buffer.writeln("late Color ${eC.toString().replaceFirst('_', '')};");
      });
    }

    buffer.writeln('');
    MyWidget().myWidget(buffer);

    buffer.writeln('final Map<String, Map<String, Color>> _colors = {};');

    ConstructTheme().constructTheme(buffer, className ?? '', vars, keys);

    ToolTheme().toolTheme(buffer, vars, keys);

    buffer.writeln('}');
    return buffer.toString();
  }
}
