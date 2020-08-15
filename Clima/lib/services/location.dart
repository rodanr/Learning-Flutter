import 'package:geolocator/geolocator.dart';
class Location{
  double longitude;
  double latitude;
  Future<void> getCurrentLocation()async{
    try{
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      //After above wait completes then below code inside this method runs
      longitude = position.longitude;
      latitude = position.latitude;
    }
    catch(e){
      print(e);
    }
  }
}