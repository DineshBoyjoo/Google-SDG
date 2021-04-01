import 'package:flutter/material.dart';
import 'package:dinfosease/globalvar.dart';
import 'package:dinfosease/viewdiseases.dart';
import 'package:dinfosease/fitness.dart';


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

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround ,
                  children: [
                    Text("Country: " +country ,style: TextStyle(fontSize: 14),),
                    Container(
                      height: 40,
                      width: 60,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(flag),
                          //whatever image you can put here
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    //Image.network(flag, width:50,height:50,),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround ,
                  children:[
                  Text("Population: ",style: TextStyle(fontSize: 14),),
                    Text(population),
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
                                //Image.network(mediaURL[0],width:50,height:50),

                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(mediaURL[0]),
                                      //whatever image you can put here
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                //First Disease Image
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
                                //Image.network(mediaURL[1],width:50,height:50),

                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(mediaURL[1]),
                                      //whatever image you can put here
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                //Second Disease Image
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
                                //Image.network(mediaURL[2],width:50,height:50),

                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(mediaURL[2]),
                                      //whatever image you can put here
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),//Third Disease Image
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
                                //Image.network(mediaURL[3],width:50,height:50), //Fourth Disease Image

                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(mediaURL[3]),
                                      //whatever image you can put here
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

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


                        TextButton(
                            style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),)),

                            child: Text(' Fitness Tips '),
                            onPressed: () {
                              print('User want to access exercise list from WHO!');
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => fitness()),
                              );

                            }
                        ),


                      ],
                    ),



                ),




                // Extensions


              ]

          )

      ),);
  }
}