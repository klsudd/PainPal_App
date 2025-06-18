import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = 'd2350e33c750b71a8cf0ca7204708e72'; // <- wklej tutaj swój prawdziwy klucz API

  Future<int?> getPressure(String city) async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['main']['pressure']?.toInt();
    } else {
      print('Blad: ${response.statusCode}');
      return null;
    }
  }
}
