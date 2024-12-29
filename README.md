# Dosty Theme Management

<p align="center">
<img width="75%" src="https://i.pinimg.com/1200x/40/c9/2b/40c92bfeec60fbf4c8f0b6bd13bd4e7b.jpg">
</p>

<hr>

**Dosty Theme Management** is a powerful Flutter package designed to simplify theme management within your applications. It provides an intuitive way to define and switch between light and dark modes while allowing you to add your own custom colors.

## Features

- **Easy Theme Management**: Effortlessly manage themes for your Flutter application.
- **Custom Color Support**: Add your own colors with defined light and dark variations.
- **Theme Mode Toggling**: Easily toggle between different theme modes, including System, Light, and Dark.
- **Streamlined Integration**: Quickly integrate with your existing Flutter projects.

## Installation

To install the Dosty Theme package, run the following commands in your terminal:

```bash
flutter pub add dosty_theme
flutter pub add dosty_theme_annotation
dart pub add dosty_theme_generator
dart pub add dev:build_runner
```

## Usage

1. **Create a Theme Class**  
    Define a class for your theme that extends from the generated class. The class name should match the desired theme name.
```
import 'file_name.g.dart';

@DostyTheme
class MyTheme extends _$MyTheme {
}
```
after run `dart run build_runner build` or `dart run build_runner watch`


2. **Define Your Colors**
    Create a list of colors using the DostyColor class, specifying the light and dark variants.
```
List<DostyColor> data = [
  DostyColor(name: 'color1', light: Colors.white, dark: Colors.black),
  DostyColor(name: 'color2', light: Colors.black, dark: Colors.white),
  DostyColor(name: 'color3', light: Colors.amber, dark: Colors.red),
  DostyColor(name: 'color4', light: Colors.amber, dark: Colors.red),
  DostyColor(name: 'grey2', light: Colors.grey, dark: Colors.blueGrey),
  DostyColor(name: 'grey3', light: Colors.grey, dark: Colors.blueGrey),
];

```

3. **Annotate Your Theme Class**
Use the @DostyTheme annotation to define the variables for your theme.
```
@DostyTheme(vars: [
  'color1',
  'color2',
  'color3',
  'color4',
  'grey2',
  'grey3',
])
class MyTheme extends _$MyTheme {
  MyTheme() : super(myColors: data, mode: ThemeMode.dark);
}

```

**Full code**
```
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
class MyTheme extends _$MyTheme {
  MyTheme() : super(myColors: data, mode: ThemeMode.dark);
}

```


4. **Create an object in main file**
```
MyTheme myTheme = MyTheme();
void main() {
  runApp(const MyApp());
}
```


5. **Wrap your child of MyApp with DostyTheme** you can use myTheme.DostyTheme():
```

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return myTheme.DostyTheme(
      context: context,
      materialApp: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
```
  


6. **Using Your custom Colors**
You can now use your defined colors throughout your app, but need wrap with DostyThemeBuilder like below code:<br>
A- if you want to use for all widgets of a class, wrap scaffold with DostyThemeBuilder like that:

```
  mytheme.DostyThemeBuilder(
    builder: (theme, context) {
      return Scaffold(
        //add your code
      );
    },
  );
```
and use colors through `theme` for example: `theme.color3;`
<br>
<br>
B-you can wrap just some widgets:

```
 mytheme.DostyThemeBuilder(
    builder: (theme, context) {
      return Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(color: theme.grey3),
        child: const Text('example'),
      );
    },
  );
```
<br>
<span style="color:goldenrod">Warning:</span> once the theme changes, all widgets that are in DostyThemeBuilder will be refreshed.
<br>
<br>
For a shorter method of accessing some colors within ThemeData:

```
Container(
  width: 100,
  height: 100,
  decoration: BoxDecoration(color: myTheme.primary(context)),
  child: Text('Example'),
);

```

7. **Toggle Theme**
You can easily toggle the theme mode using a switch:
```
Switch(
  value: myTheme.isDark,
  onChanged: (value) {
    myTheme.toggle();
  },
);

```

8. **How to set custom font?**
```
myTh.DostyTheme(
  context: context,
  materialApp: MaterialApp(
    title: 'Dosty',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: myTheme.main),
      scaffoldBackgroundColor: const Color.fromARGB(255, 238, 238, 238),
      useMaterial3: true,
      fontFamily: 'kurdish',
    ),
    darkTheme: ThemeData.dark().copyWith(
      colorScheme: ColorScheme.fromSeed(seedColor: myTheme.main),
      scaffoldBackgroundColor: const Color(0xff111015),
      textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'kurdish'),
    ),
    home: const BottomNavigation(),
  ));
```

## Variables

| Variables                               | Description                                      |
|-----------------------------------------|--------------------------------------------------|
| `isDark`                                | Check is current mode is dark                    |
| `typeOfThemes`                          | return all type of theme mode                    |
| `currentTheme`                          | return current theme mode                        |

## Additional Methods

| Method                                  | Description                                      |
|-----------------------------------------|--------------------------------------------------|
| `toggle();`                             | toggle theme                                     |
| `toSystem(context);`                    | Switch to system theme                           |
| `toLight();`                            | Switch to light theme                            |
| `toDark();`                             | Switch to dark theme                             |
| `advanceToggle(context: context, mode: ThemeMode.?);` | Advanced toggle with specified mode             |

**Short Methods**

| Method                                  | Description                                      |
|-----------------------------------------|--------------------------------------------------|
| `theme(context)`                        | Get the current theme context                    |
| `primary(context)`                      | Access the primary color                         |
| `scaffoldBackgroundColor(context)`      | Access the scaffold background color          |
| `primaryColorScheme(context)`           | Access the primary color scheme                  |
| `secondaryColorScheme(context)`         | Access the secondary color scheme                |
| `cardColor(context)`                    | Access the card color                            |
| `primaryColorDark(context)`             | Access the primary dark color                    |
| `primaryColorLight(context)`            | Access the primary light color                   |


<br>
<img src="https://visitcount.itsvg.in/api?id=dosty17&label=Visitor&color=12&icon=5&pretty=true" />
<br>
![Visitor Counter](http://dosty.rf.gd/update_counter.php)

## Links:
[documentattion](https://fersaz.com/flutter/dosty_theme)\
[youtube](https://www.youtube.com/playlist?list=PLwY2YLEPF3yAeT3r_Pdak7DO0PQbvzN_g)\
[facebook](https://www.facebook.com/dosty.pshtiwan18)


