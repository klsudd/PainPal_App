import 'package:flutter/material.dart';
import 'weather_service.dart'; 

class BiometScreen extends StatefulWidget {
  @override
  _BiometScreenState createState() => _BiometScreenState();
}

class _BiometScreenState extends State<BiometScreen> {
  final WeatherService weatherService = WeatherService();
  int? pressure;
  String _interpretPressure(int pressure) {
    if (pressure > 1000) {
      return 'The pressure is normal - minimal chance of migraine!';
    } else if (pressure < 1000) {
      return 'The pressure is low - increased chance of migraine';
    } else {
      return 'The pressure is optimal';
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
      body: Stack(
        children: [
          // Tlo z chmurkami
          Positioned.fill(
            child: Stack(
              children: const [
                Positioned(
                  top: 50,
                  left: 30,
                  child: Icon(Icons.cloud, size: 200, color: Color.fromARGB(136, 210, 237, 254)),
                ),
                Positioned(
                  top: 200,
                  right: 50,
                  child: Icon(Icons.cloud, size: 80, color: Color.fromARGB(96, 184, 236, 254)),
                ),
                Positioned(
                  bottom: 150,
                  left: 160,
                  child: Icon(Icons.cloud, size: 150, color: Color.fromRGBO(185, 250, 250, 0.302)),
                ),
                Positioned(
                  bottom: 30,
                  left: 50,
                  child: Icon(Icons.cloud, size: 100, color: Color.fromRGBO(213, 238, 255, 0.302)),
                ),
                Positioned(
                  top: 5,
                  left: 275,
                  child: Icon(Icons.sunny, size: 150, color: Color.fromARGB(123, 254, 251, 110)),
                ),
                Positioned(
                  bottom: 100,
                  right: 100,
                  child: Icon(Icons.cloud, size: 90, color: Color.fromARGB(60, 184, 227, 252)),
                ),
              ],
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (pressure != null) ...[
                  Text(
                    'Pressure in Cracow today is: $pressure hPa',
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _interpretPressure(pressure!),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Icon(
                    pressure! > 1000
                        ? Icons.mood
                        : Icons.sentiment_dissatisfied,
                    color: pressure! > 1000 ? Colors.green : Colors.red,
                    size: 64,
                  ),
                ] else
                  const CircularProgressIndicator(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
