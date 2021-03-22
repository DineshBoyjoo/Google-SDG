import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';
import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';



final String country = "Mauritius";
final String population = "1.2M";


var emmergencyContact = ['456','123','789'];

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

  // if(firstRun=false){
  //   firstRun=true;
  //   runApp(MyApp());
  //
  // }
  // else{
  //   runApp(GettingStarted());
  // }
  runApp(MyApp());


}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DinfoSease Application Services',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'DinfoSEASE Welcome Page'),

      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;


  @override

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  //
  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {



    // if(firstRun=false){
    //   firstRun=true;
    // }
    // else{
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => tester()),
    //   );
    //
    // }


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


            Image.asset(
                "assets/logo.png", height: 100, width:100),


           // Pulse(child: Text("Warning Config") , infinite:true,),





          Text("\n"),
            Text("Welcome to DinfoSEASE",style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
            Text("\n"),
            Text("Your health companion platform to access disease statistics and up to date preventive measures.",textAlign: TextAlign.center,style:TextStyle(fontSize: 15)),
            //Text("\n+ Many other features!",textAlign: TextAlign.center,style:TextStyle(fontSize: 15)),

            Text("\n"),

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


            SlideInLeft(child:
            TextButton(

                child:
                Text(' Configure Settings ', style:TextStyle(backgroundColor: Colors.red,color:Colors.white,fontSize: 23,)),
                onPressed: () {
                  print('User want to configure settings!');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ConfigureSetting()),
                  );

                }
            ),),

            Text("\n"),

            SlideInRight(
              child: Text("Warning: "+warningBannerData,
                style: TextStyle(
                fontSize: 20,backgroundColor: Colors.yellow,
            ),), ),



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

          Center( //Can remove
            child:
            Container(

              decoration: BoxDecoration(

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
                                  MaterialPageRoute(builder: (context) => DiseaseViewer(disease: diseaseName[0],descript: mediaURL[0])),
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
                                  MaterialPageRoute(builder: (context) => DiseaseViewer(disease: diseaseName[1],descript: mediaURL[1])),
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
                                  MaterialPageRoute(builder: (context) => DiseaseViewer(disease: diseaseName[2],descript: mediaURL[2])),
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
                                  MaterialPageRoute(builder: (context) => DiseaseViewer(disease: diseaseName[3],descript: mediaURL[3])),
                                );

                              }
                          ),
                        ],),
                    ],

                  ),

                ],
              )

            ),
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


          ],
        )





      ),
    );
  }


}


class ConfigureSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings",style:TextStyle(fontSize: 20)),
        backgroundColor: Colors.orange,
        centerTitle:true,
      ),
      body: Center(

          child: ListView(
            children: [


            ],
          )





      ),
    );
  }


}




class DiseaseViewer extends StatelessWidget {

  final String disease;
  final String descript; //URL of image

  // receive data from the FirstScreen as a parameter
  DiseaseViewer({Key key, @required this.disease, @required this.descript}) : super(key: key);

  // receive data from the FirstScreen as a parameter


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( disease,style:TextStyle(fontSize: 17)),
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

               Image.network(descript,width:50,height:50),
                Column(children: [

                  Text(disease),
                  Text("X Active Cases"),

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

                messageContacts(disease)  },

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
  final String keyWord = "health centers near me";
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


messageContacts(String m) async {

  String MessageWarn = "*THIS IS AN AUTOMATED MESSAGE FROM DinfoSEASE Application*"
      "\n I need medical assistance right now and I am suspicious about "+m+" disease. Please Call me as soon as possible";

  String concatNumbers="";
  for(int y=0;y<emmergencyContact.length;y++){
    concatNumbers=concatNumbers+","+emmergencyContact[y];
  }
  final String urlConstruct = "sms:"+concatNumbers+"?&body="+MessageWarn;

  if (await canLaunch(urlConstruct)) {
    await launch(urlConstruct);
  }
  else {
    throw "Cannot Use messaging services for the moment";
  }
}