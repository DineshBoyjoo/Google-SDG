import 'package:flutter/material.dart';
import 'package:dinfosease/globalvar.dart';
import 'package:dinfosease/viewdiseases.dart';
import 'package:dinfosease/maps.dart';


class getStart extends StatefulWidget {
  @override
  getStartState createState() => getStartState();
}

class getStartState extends State<getStart> {

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
                                        //MaterialPageRoute(builder: (context) => DiseaseViewer(location: 0, )),
                                        MaterialPageRoute(builder: (context) =>disease(location: 0,)),

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
                                        MaterialPageRoute(builder: (context) => disease(location: 1, )),
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
                                        MaterialPageRoute(builder: (context) => disease(location: 2, )),
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
                                        MaterialPageRoute(builder: (context) => disease(location: 3, )),
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
                        MaterialPageRoute(builder: (context) => maps()),
                      );

                    }
                ),

              ]

          )

      ),);
  }
}