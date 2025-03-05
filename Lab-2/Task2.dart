// Asynchronous Dart Program with API Simulation

import 'dart:async';

Future<String> fetchWeatherData() async {
  await Future.delayed(Duration(seconds: 3));
  // Simulating API response
  bool success = DateTime.now().second % 2 == 0; // Random success/failure
  if (success) {
    return 'Weather: Sunny, 25°C';
  } else {
    throw Exception('Failed to fetch weather data');
  }
}

void main() async {
  print('Fetching weather data...');
  try {
    String weather = await fetchWeatherData();
    print('Weather Data: $weather');
  } catch (e) {
    print('Error: $e');
  }
}
