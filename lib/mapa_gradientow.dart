import 'package:flutter/material.dart';

List<Color> getGradientForPressure(double pressure) {
  if (pressure < 1000) {
    return [Colors.red.shade900, Colors.redAccent];
  } else if (pressure < 1010) {
    return [Colors.orange, Colors.deepOrangeAccent];
  } else if (pressure < 1020) {
    return [Colors.lightBlue, Colors.blue];
  } else {
    return [Colors.green, Colors.teal]; 
  }
}
