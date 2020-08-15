import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/screens/city_screen.dart';
int temperature;
int condition;
String cityName;
String weatherMessage;
String weatherIcon;

class LocationScreen extends StatefulWidget {
  final weatherData;
  LocationScreen({this.weatherData});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  void updateUI(dynamic weatherData){
    setState(() {
      //Sometime we got double sometime integer so it was hard to convert into int
      // so we multiplied with a double number so that either its int or double it changes to double and later we converted into int
      double temp = ((weatherData['main']['temp'])*1.00001);
      temperature = temp.toInt();
      condition = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
      weatherMessage = weatherModel.getMessage(temperature);
      weatherIcon = weatherModel.getWeatherIcon(condition);

    });
  }
  @override
  void initState() {
    updateUI(widget.weatherData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: ()async {
                      var newWeatherData = await weatherModel.getWeatherDataByLocation();
                      updateUI(newWeatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      //should use var always to retrieve from pop
                      //should wait as we don't know when the user presses get weather
                      var cityToSearch =await Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CityScreen();
                      }));
                      print (cityToSearch);
                      if(cityToSearch!=null){
                        var newWeatherData = await weatherModel.getWeatherDataByCityName(cityToSearch);
                        updateUI(newWeatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°C',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '${weatherModel.getWeatherIcon(condition)}',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "${weatherModel.getMessage(temperature)} in $cityName",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
