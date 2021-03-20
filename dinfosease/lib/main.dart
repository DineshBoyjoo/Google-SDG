import 'package:flutter/material.dart';

bool firstRun = false;
var mediaURL = [
  'https://www.foundationhealth.org/.api2/binaries/0PhOWfdecz/thumbnails/Icon-germ-04.png?width=300',
  'https://image.flaticon.com/icons/png/512/773/773895.png',
  'https://thumbs.dreamstime.com/b/malaria-mosquito-icon-vector-outline-illustration-malaria-mosquito-icon-vector-outline-malaria-mosquito-sign-isolated-contour-168860447.jpg',
  'https://thumbs.dreamstime.com/z/sneeze-common-cold-flu-icon-as-eps-file-190899647.jpg'];

void main() {
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




          Text("\n"),
            Text("Welcome to DinfoSEASE",style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
            Text("\n"),
            Text("your platform to access disease statistics and up to date preventive measures.",textAlign: TextAlign.center,style:TextStyle(fontSize: 15)),

            Text("\n"),

            TextButton(

                child: Text(' Go to Dashboard ', style:TextStyle(backgroundColor: Colors.orange,color:Colors.white,fontSize: 20,)),
                onPressed: () {
                  print('User want to get Started!');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GettingStarted()),
                  );

                }
            ),



          ],


        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class GettingStarted extends StatelessWidget {

  final String _country="Mauritius";

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
            Text("Population: 1.2M ",style: TextStyle(fontSize: 14),),

            Row(

              children: [
                Text("Country: " +_country ,style: TextStyle(fontSize: 14),),
                Image.network("https://media.gettyimages.com/photos/national-flag-of-the-republic-of-mauritius-picture-id645009405?s=612x612", width:50,height:50,),
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

                              child: Text('COVID-19'), //First Disease
                              onPressed: () {
                                print('Clicked on a disease');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => DiseaseViewer(disease: "COVID-19",descript: mediaURL[0])),
                                );

                              }
                          ),


                      ],



                      ),




                      Column(

                        children: [

                          Image.network(mediaURL[1],width:50,height:50), //Second Disease Image

                          TextButton(


                              child: Text('Tuberculosis'), //Second Disease
                              onPressed: () {
                                print('Clicked on a disease');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => DiseaseViewer(disease: "Tuberculosis",descript: mediaURL[1])),
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

                              child: Text('Malaria'), //Third Disease
                              onPressed: () {
                                print('Clicked on a disease');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => DiseaseViewer(disease: "Malaria",descript: mediaURL[2])),
                                );

                              }
                          ),
                        ],),

                      Column(
                        children: [
                          Image.network(mediaURL[3],width:50,height:50), //Fourth Disease Image
                          TextButton(

                              child: Text('Flu'), //Fourth Disease
                              onPressed: () {
                                print('Clicked on a disease');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => DiseaseViewer(disease: "Flu",descript: mediaURL[3])),
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

        child: Text("Test"),


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

        Column(
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
            )
          ],
        )




      ),
    );
  }


}