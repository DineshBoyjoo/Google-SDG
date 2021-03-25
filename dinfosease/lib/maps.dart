import 'package:flutter/material.dart';


class maps extends StatefulWidget {
  @override
  mapsState createState() => mapsState();
}

class mapsState extends State<maps> {



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
                Text("This is map Data"),

            ],
          )

      ),
    );
  }
}