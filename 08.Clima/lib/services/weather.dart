import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';
const openWeatherURL = 'https://api.openweathermap.org/data/2.5/weather?';
const apiKey = 'b54197cfb25fda2d496a46aa81a9e24d';
class WeatherModel {
Future<dynamic> getWeatherDataByLocation() async{
  try{
    Location location = Location();
    await location.getCurrentLocation();
    String url= 'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url:url);
    var weatherData = await networkHelper.getDecodedData();
    print(weatherData);
    return weatherData;
  }
  catch(e){
    print(e);
  }
}

Future<dynamic> getWeatherDataByCityName(String cityName)async{
  String url ='https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';
  NetworkHelper networkHelper = NetworkHelper(url: url);
  var weatherData = await networkHelper.getDecodedData();
  return weatherData;

}

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
