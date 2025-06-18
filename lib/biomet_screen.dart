
import 'package:flutter/material.dart';
import 'weather_service.dart'; // Upewnij się, że ścieżka jest poprawna

class BiometScreen extends StatefulWidget {
  @override
  _BiometScreenState createState() => _BiometScreenState();
}

class _BiometScreenState extends State<BiometScreen> {
  final WeatherService weatherService = WeatherService();
  int? pressure;
  String _interpretPressure(int pressure) {
  if (pressure > 1000) {
    return 'Ciśnienie jest wysokie';
  } else if (pressure < 1000) {
    return 'Ciśnienie jest niskie';
  } else {
    return 'Ciśnienie jest optymalne';
  }
}


  @override
  void initState() {
    super.initState();
    loadWeather();
  }

  Future<void> loadWeather() async {
    final pres = await weatherService.getPressure('Krakow');
    setState(() {
      pressure = pres;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (pressure != null) ...[
              Text(
                'Cisnienie w Krakowie: $pressure hPa',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 16),
              Text(
                _interpretPressure(pressure!),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
          ] else
            const CircularProgressIndicator(),
        ],
      ),
    ),
    );
  }
}
