import 'package:flutter/material.dart';
import 'package:untitled/services/weather_service.dart';
import '../model/weather.dart';

class Page4 extends StatefulWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  TextEditingController _rech = TextEditingController();
  WeatherService weatherService = WeatherService();
  Weather weather = Weather();

  String currentWeather = "";
  double tempC = 0;
  double tempF = 0;

  @override
  void initState() {
    super.initState();
    _rech.addListener(_searchWeather);
  }

  @override
  void dispose() {
    _rech.dispose();
    super.dispose();
  }

  void _searchWeather() async {
    weather = await weatherService.getWeatherData(_rech.text);

    setState(() {
      currentWeather = weather.condition;
      tempF = weather.temperatureF;
      tempC = weather.temperatureC;
    });
    print(weather.temperatureC);
    print(weather.temperatureF);
    print(weather.condition);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Skincare Weather",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.only(
          bottom: 5,
          left: 16,
          right: 16,
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/gamme.PNG',
              width: 400,
              height: 200,
            ),
            const SizedBox(height: 20),
            Text(
              "Check Your Skincare Weather",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Always put your suncreen",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),
            TextField(
              controller: _rech,
              onSubmitted: (_) {
                _searchWeather();
              },
              decoration: InputDecoration(
                labelText: "Enter your location",
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
            const SizedBox(height: 10),

            const SizedBox(height: 10),
            Text(
              currentWeather,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Temperature (C): $tempC',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              'Temperature (F): $tempF',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
