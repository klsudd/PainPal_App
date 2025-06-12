import 'package:flutter/material.dart';
//import "calendarscreen.dart";
import "home_screen.dart";

void main() {
  runApp(PainPalApp());
}

class PainPalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PainPal',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: HomeScreen(),
    );
  }
}
