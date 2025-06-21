import 'package:flutter/material.dart';
import "home_screen.dart";

void main() {
  runApp(PainPalApp());
}

class PainPalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PainPal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        sliderTheme: SliderThemeData(
          activeTrackColor: const Color.fromARGB(255, 236, 73, 193),
          inactiveTrackColor: const Color.fromARGB(255, 255, 187, 239),
          thumbColor: const Color.fromARGB(255, 255, 90, 211),
          overlayColor: const Color.fromARGB(255, 252, 68, 218).withAlpha(32),
          trackHeight: 4.0,
        ),
        dropdownMenuTheme: DropdownMenuThemeData(
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: const Color.fromARGB(255, 255, 231, 250),
          ),
        ),
        radioTheme: RadioThemeData(
          fillColor: WidgetStateProperty.all(const Color.fromARGB(255, 250, 55, 221)),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
