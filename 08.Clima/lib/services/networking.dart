//This is for getting the decodedJSON from the api calling
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
class NetworkHelper{
  final url;
  NetworkHelper({this.url});
Future getDecodedData()async{

    http.Response response = await http.get(url);
    //If server is responding
    if(response.statusCode==200){
      String responseBody = response.body;
      var decodedData =convert.jsonDecode(responseBody);
      return decodedData;
    }
    else{
      print(response.statusCode);
      return('error');
    }
}
}