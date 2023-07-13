import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:weather_app/services/location.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/services/networking.dart';
import 'package:weather_app/utilities/constants.dart';

import '../services/weather.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  //   Navigator.push(context, MaterialPageRoute(builder: (context) {
  //   return LocationScreen(weatherData: weatherData);
  // }));

  void getweatherData() async {
    WeatherModel weatherModel = WeatherModel();
    await weatherModel.getCurrentWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weatherData: weatherModel);
    }));
  }

  @override
  void initState() {
    getweatherData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
