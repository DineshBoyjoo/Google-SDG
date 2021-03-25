import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart' ;



messageContacts(String MessageWarn,var _phoneNum,var emergencyContact) async { //Param can be used from anywhere to call func

  var locationMessage = "";
  String concatNumbers=_phoneNum;
  //Both current and last known position will be used to send to emergency contact list
  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  Position lastPosition = await Geolocator.getLastKnownPosition();

  print("User Location Sending: https://www.google.com/maps?&q="+position.latitude.toString()+"+"+position.longitude.toString());
  //%2B is the URL encoding for + sign
  MessageWarn=MessageWarn+" My Current Location is: https://www.google.com/maps?q="+position.latitude.toString()+"+"+position.longitude.toString()+"."; //For Current Location
  MessageWarn=MessageWarn+" My Last Online Location is: https://www.google.com/maps?q="+lastPosition.latitude.toString()+"+"+lastPosition.longitude.toString(); //For Current Location
  //print("MSG: "+MessageWarn);

  for(int y=0;y<emergencyContact.length;y++){
    concatNumbers=concatNumbers+","+emergencyContact[y];
  }

  final String urlConstruct = "sms:"+concatNumbers+"?&body="+MessageWarn;

  if (await canLaunch(urlConstruct)) {
    await launch(urlConstruct);
  }
  else {
    throw "Cannot Use messaging services for the moment";
  }
}


callHotlineHealth() async {
  final String urlConstruct = "tel:114";

  if (await canLaunch(urlConstruct)) {
    await launch(urlConstruct);
  }
  else {
    throw "Cannot call the hotline";
  }
}


findNearestHealthCenter() async {
  final String keyWord = "health centers near me"; //Change when google map updates their search queries
  print("Redirecting to Nearest Health Center");
  final String urlConstruct = "https://www.google.com/maps/search/"+keyWord;

  if (await canLaunch(urlConstruct)) {
    await launch(urlConstruct);
  }
  else {
    throw "Cannot launch Maps";
  }
}