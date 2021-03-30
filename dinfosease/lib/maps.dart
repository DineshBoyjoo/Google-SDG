import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';

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

              //TextButton(onPressed:  _funcTest, child: Text("Click Me for dta")),


            ],
          )

      ),
    );
  }
}



//  _funcTest() async {
//   final webScraper = WebScraper('https://worldpopulationreview.com');
//   if (await webScraper.loadWebPage('/')) {
//     List<Map<String, dynamic>> elements =
//     webScraper.getElement('div.center', ['title']);
//     print(elements[0]);
//   }
//
// }

