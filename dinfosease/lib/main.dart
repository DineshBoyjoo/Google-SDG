import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart' ;


  var _phoneNum = ""; //Global Var for Sharing with Class :messageContacts And HomePage


  final String country = "Mauritius";
  final String population = "1.2M";

  var emergencyContact = []; //Serves as broadcast Address for Private emergency Message. Fill in with numbers if dev wishes to broadcast without adding number to interface

  final String flag = "https://media.gettyimages.com/photos/national-flag-of-the-republic-of-mauritius-picture-id645009405?s=612x612";


  bool firstRun = false;
  var diseaseName=["COVID-19","Tuberculosis","Malaria","Flu"];
  var mediaURL = [
    'https://www.foundationhealth.org/.api2/binaries/0PhOWfdecz/thumbnails/Icon-germ-04.png?width=300',
    'https://image.flaticon.com/icons/png/512/773/773895.png',
    'https://thumbs.dreamstime.com/b/malaria-mosquito-icon-vector-outline-illustration-malaria-mosquito-icon-vector-outline-malaria-mosquito-sign-isolated-contour-168860447.jpg',
    'https://thumbs.dreamstime.com/z/sneeze-common-cold-flu-icon-as-eps-file-190899647.jpg'];
  var activeCountDisease = [ 10 ,11,12,13 ];
  String warningBannerData = "40 New Covid Cases today 21/03/2021";

  void main() {
    runApp(MyApp());
  }

  class Storage{

    Future<String> get _localPath async{
      final directory = await getApplicationDocumentsDirectory();
      return directory.path;
    }

    Future<File> get _localFile async {
      final path = await _localPath;
      return File("$path/contactList.txt");
    }

    Future<String> readContact() async {
      try{
        final file =  await _localFile;
        String contents = await file.readAsString();
        return contents;
      }catch(e){
        return "Error";
      }


    }

    Future<File> writeContact(String data) async {
      final file = await _localFile;
      return file.writeAsString('$data');
    }
  }

  class MyApp extends StatelessWidget {
    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'DinfoSease Application Services',
        theme: ThemeData(

          primarySwatch: Colors.blue,

          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'DinfoSEASE Welcome Page'),
        //home: LocationApp(), //Debugging Purposes

        debugShowCheckedModeBanner: false,
      );
    }
  }



  class MyHomePage extends StatefulWidget {
    final Storage storage = Storage();

    MyHomePage({Key key, this.title}) : super(key: key);
    final String title;

    @override

    _MyHomePageState createState() => _MyHomePageState();
  }

  class _MyHomePageState extends State<MyHomePage> {
      final PhoneController = new TextEditingController();
      String compon = "";
      bool AllowedEditEmergency =false;
  @override
  void initState(){
     widget.storage.readContact().then((String value)
         {
           setState(() {
             compon = value;
           });
         }

     );
   }

   Future<File> _showContact(){
     setState(() {
       _phoneNum = PhoneController.text;
       compon=_phoneNum;
       //compon=compon+"123,";
       //compon=""; //To clear all fields used for testing

     });

     return widget.storage.writeContact(compon);
   }

    @override
    Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title, style:TextStyle(fontSize: 15)),
          backgroundColor: Colors.orange,
          centerTitle:true,
        ),
        body: Center(

          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: ListView(
            children:[

              //Text("$compon"),// Used for debugging purposes
              //FlatButton(child: Text("Click Me"),onPressed: _showContact ), // Used for debugging purposes


              //Used if there is a warning Feature

              // SlideInRight(
              //   child: Text("Warning: "+warningBannerData,
              //     style: TextStyle(
              //       fontSize: 20,backgroundColor: Colors.yellow,
              //     ),), ),

              Image.asset(
                  "assets/logo.png", height: 100, width:100),

            Text("\n"),
              Text("Welcome to DinfoSEASE",style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
              SizedBox(height: 10),
              Text("Your health companion platform to access disease statistics and up to date preventive measures.",textAlign: TextAlign.center,style:TextStyle(fontSize: 15)),
              //Text("\n+ Many other features!",textAlign: TextAlign.center,style:TextStyle(fontSize: 15)),
              SizedBox(height: 20),

              SlideInLeft(child:
              TextButton(
                  child:
                  Text(' Go to Dashboard ', style:TextStyle(backgroundColor: Colors.orange,color:Colors.white,fontSize: 23,)),
                  onPressed: () {
                    print('User want to get Started!');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GettingStarted()),
                    );
                  }
              ),),

              SizedBox(height: 10),

              SlideInLeft(child:
              TextButton(
                  child:
                  Text(' Send SOS Message ', style:TextStyle(backgroundColor: Colors.red,color:Colors.white,fontSize: 23,)),
                  onPressed: () {
                    print('User wants to send sos');
                    messageContacts(
                        "*THIS IS AN AUTOMATED MESSAGE FROM DinfoSEASE Application* I need medical help right now. Please contact me immediately."
                    );
                  }
              ),),

              SizedBox(height: 10),

              SlideInLeft(child:
              TextButton(
                  child:
                  Text('Toggle Emergency List', style:TextStyle(backgroundColor: Colors.blue,color:Colors.white,fontSize: 23,)),
                  onPressed: () {
                    print('User want to Access Emergency List!');
                    setState(() {
                      AllowedEditEmergency = !AllowedEditEmergency;
                    });

                  }
              ),),

              if (AllowedEditEmergency)
                new Column(
                children: [

                  Divider(
                      color: Colors.black
                  ),
                  Text("Enter a contact number followed by another contact number using   ' , '\n\n For Example '999,114,5925XXXX' and so on \n", style:TextStyle(color:Colors.grey[500],)),
                  TextField(
                    controller: PhoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: "Enter Emergency Contact Numbers.",
                    ),
                  ),

                  TextButton(child: Text("Submit"), onPressed:  _showContact),
                  Text("Current Emergency Contact List: \n $compon"),

                  Divider(
                      color: Colors.black
                  ),
              ],),
              Text("\n"),
            ],

          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      );
    }
  }



  class GettingStarted extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("DinfoSEASE Dashboard ",style:TextStyle(fontSize: 17)),
          backgroundColor: Colors.orange,
          centerTitle:true,
        ),
        body: Center(

          child: ListView(
              padding: EdgeInsets.fromLTRB(30, 10, 1, 0),
            children: [
              Text("Population: "+population,style: TextStyle(fontSize: 14),),

              Row(
                children: [
                  Text("Country: " +country ,style: TextStyle(fontSize: 14),),
                  Image.network(flag, width:50,height:50,),
                ],
              ),


              Text("\n Active Disease Dashboard",textAlign: TextAlign.justify,),


              Container(
                  margin: EdgeInsets.fromLTRB(10,0,20,0),
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,

                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child: new Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:[

                        Column(
                          children: [
                          Image.network(mediaURL[0],width:50,height:50), //First Disease Image
                            TextButton(

                                child: Text(diseaseName[0]), //First Disease
                                onPressed: () {
                                  print('Clicked on a disease');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => DiseaseViewer(location: 0, )),
                                  );
                                }
                            ),
                        ],
                        ),

                        Column(

                          children: [
                            Image.network(mediaURL[1],width:50,height:50), //Second Disease Image
                            TextButton(
                                child: Text(diseaseName[1]), //Second Disease
                                onPressed: () {
                                  print('Clicked on a disease');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => DiseaseViewer(location: 1, )),
                                  );
                                }
                            ),
                          ],),
                        ],
                    ),

                    Text("\n"),

                    Row(

                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:[

                        Column(
                          children: [
                            Image.network(mediaURL[2],width:50,height:50), //Third Disease Image
                            TextButton(

                                child: Text(diseaseName[2]), //Third Disease
                                onPressed: () {
                                  print('Clicked on a disease');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => DiseaseViewer(location: 2, )),
                                  );

                                }
                            ),
                          ],),

                        Column(
                          children: [
                            Image.network(mediaURL[3],width:50,height:50), //Fourth Disease Image
                            TextButton(

                                child: Text(diseaseName[3]), //Fourth Disease
                                onPressed: () {
                                  print('Clicked on a disease');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => DiseaseViewer(location: 3, )),
                                  );

                                }
                            ),
                          ],),
                      ],

                    ),

                  ],
                )

              ),


              TextButton(

                  child: Text(' View Map ', style:TextStyle(backgroundColor: Colors.blue,color:Colors.white,fontSize: 20,)),
                  onPressed: () {
                    print('User want to access map!');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ViewMap()),
                    );

                  }
              ),

            ]

          )

        ),
      );
    }

  }


  class ViewMap extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Map Data",style:TextStyle(fontSize: 17)),
          backgroundColor: Colors.orange,
          centerTitle:true,
        ),
        body: Center(

          child: ListView(
            children: [
  //Map Content Goes here


            ],
          )

        ),
      );
    }
  }

  class DiseaseViewer extends StatelessWidget {

    final int location;
  //URL of image

    // receive data from the FirstScreen as a parameter
    DiseaseViewer({Key key, @required this.location}) : super(key: key);

    // receive data from the FirstScreen as a parameter

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(diseaseName[location],style:TextStyle(fontSize: 17)),
          backgroundColor: Colors.orange,
          centerTitle:true,
        ),
        body: Center(
          child:

          ListView(
            children: <Widget>[

              Row(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                 Image.network(mediaURL[location],width:50,height:50),
                  Column(children: [

                    Text(diseaseName[location]),
                    Text(activeCountDisease[location].toString()+" Active Cases"),

                  ],),


                ],
              ),

              Divider(
                  color: Colors.black
              ),

              Text("Symptoms\n",textAlign: TextAlign.center,),
              Text("If any Symptoms, place here"),
              Text("If any Symptoms, place here"),

              Text("\n"),
              Divider(
                  color: Colors.black
              ),

              Text("Treatment\n",textAlign: TextAlign.center,),
              Text("If any treatment, place here"),

              TextButton(
                  style: ButtonStyle(

                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    overlayColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {

                        if (states.contains(MaterialState.focused) ||
                            states.contains(MaterialState.pressed))
                          return Colors.white.withOpacity(0.2);
                        else {
                          return null;
                        }
                      },
                    ),

                  ),
                  onPressed: () =>
                  {
                    _findNearestHealthCenter()  },

                  child: new Row(
                    children: [

                      Icon(
                        Icons.add_location_rounded,
                        color: Colors.white,
                        size: 25.0,
                        semanticLabel: 'Open Maps to get direction to closest health center',
                      ),
                      Text(' Go to your nearest Health Center!'),
                    ],
                  ),
              ),

              TextButton(
                style: ButtonStyle(

                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {

                      if (states.contains(MaterialState.focused) ||
                          states.contains(MaterialState.pressed))
                        return Colors.white.withOpacity(0.2);
                      else {
                        return null;
                      }
                    },
                  ),

                ),
                onPressed: () =>
                {
                  _callHotlineHealth()  },

                child: new Row(
                  children: [

                    Icon(
                      Icons.local_phone,
                      color: Colors.white,
                      size: 25.0,
                      semanticLabel: 'Open Dialer to compose hotline of Health Dept in your region ',
                    ),
                    Text(' Call Local Health Hotline!'),
                  ],
                ),
              ),


              TextButton(
                style: ButtonStyle(

                  backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {

                      if (states.contains(MaterialState.focused) ||
                          states.contains(MaterialState.pressed))
                        return Colors.white.withOpacity(0.2);
                      else {
                        return null;
                      }
                    },
                  ),

                ),
                onPressed: () =>
                {
                    messageContacts(
                        "*THIS IS AN AUTOMATED MESSAGE FROM DinfoSEASE Application* I need medical assistance right now and I am suspicious about "+diseaseName[location]+" disease. Please Call me as soon as possible."
                    )  },

                child: new Row(
                  children: [

                    Icon(
                      Icons.message_outlined,
                      color: Colors.white,
                      size: 25.0,
                      semanticLabel: 'Compose your message to the list of contact',
                    ),
                    Text(' Request help from Emergency List'),
                  ],
                ),
              ),

              Divider(
                  color: Colors.black
              ),

            ],
          )

        ),
      );
    }


  }



  _findNearestHealthCenter() async {
      final String keyWord = "health centers near me"; //Change when google map updates their search queries

      final String urlConstruct = "https://www.google.com/maps/search/"+keyWord;

      if (await canLaunch(urlConstruct)) {
        await launch(urlConstruct);
      }
       else {
        throw "Cannot launch Maps";
      }
  }


  _callHotlineHealth() async {
    final String urlConstruct = "tel:114";

    if (await canLaunch(urlConstruct)) {
      await launch(urlConstruct);
    }
    else {
      throw "Cannot call the hotline";
    }
  }

  messageContacts(String MessageWarn) async { //Param can be used from anywhere to call func

      var locationMessage = "";
      String concatNumbers=_phoneNum;
      //Both current and last known position will be used to send to emergency contact list
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      Position lastPosition = await Geolocator.getLastKnownPosition();

      print("User Location Sending: https://www.google.com/maps?&q="+position.latitude.toString()+"+"+position.longitude.toString());

      MessageWarn=MessageWarn+" My Current Location is: https://www.google.com/maps?q="+position.latitude.toString()+"+"+position.longitude.toString()+"."; //For Current Location
      MessageWarn=MessageWarn+" My Last Online Location is: https://www.google.com/maps?q="+lastPosition.latitude.toString()+"+"+lastPosition.longitude.toString(); //For Current Location

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




