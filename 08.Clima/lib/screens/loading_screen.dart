import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/screens/location_screen.dart';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}
class _LoadingScreenState extends State<LoadingScreen> {
  void getWeatherData()async{
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getWeatherDataByLocation();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(weatherData:weatherData);
    }));
  }
  @override
  void initState(){
    getWeatherData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
