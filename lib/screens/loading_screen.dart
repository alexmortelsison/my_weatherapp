import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_test/screens/location_screen.dart';
import 'package:weather_test/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  Future getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    weatherModel.getLocationWeather();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const LocationScreen(
            locationWeather: null,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitCircle(
        color: Colors.white,
        size: 20,
      ),
    );
  }
}
