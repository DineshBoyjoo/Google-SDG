import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';

var textual ;
var toOutput;

var info1=" NO Data Yet ",info2=" NO Data Yet ",info3=" NO Data Yet ",info4=" NO Data Yet ",info5=" NO Data Yet ",info6=" NO Data Yet ",info7=" NO Data Yet ",info8=" NO Data Yet ",info9=" NO Data Yet ",info10=" NO Data Yet ";



// _funcTest() async {
//   final webScraper = WebScraper('https://www.who.int');
//   if (await webScraper.loadWebPage('/news-room/fact-sheets/detail/physical-activity')) {
//     List<Map<String, dynamic>> elements = webScraper.getElement('article.sf-detail-body-wrapper', ['title']);
//     textual=elements[0];
//     print(elements[0]);
//   }
// }

class maps extends StatefulWidget {
  @override
  mapsState createState() => mapsState();
}

class mapsState extends State<maps> {


  bool completed = false;
  String popNum;


  // @override
  // void initState(){
  //
  //   setState(() {
  //     _funcTest();
  //     toOutput=textual;
  //
  //
  //   });
  // }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() async {

    String start="";
    String end="";
    //int startIndex = textual.indexOf(start);
    //int endIndex = textual.indexOf(end, startIndex + start.length);
    int startIndex;
    int endIndex;

    final webScraper = WebScraper('https://www.who.int');

    try{
      await webScraper.loadWebPage('/news-room/fact-sheets/detail/physical-activity');
      List<Map<String, dynamic>> results = webScraper.getElement('article.sf-detail-body-wrapper', ['title']);
      textual=results[0]['title'];


//    info1,info2,info3,info4,info5,info6,info7,info8,info9,info10
      //textual=textual.substring(startIndex + start.length, endIndex);

      //Done for individual age group because source does not have unique separation in html tags to be used for web scraping. Substring being used
        setState(() {
          btns=true;
          completed = true;
          //For group 1

          start="In a 24-hour day, infants (less than 1 year) should:";
          end="In a 24-hour day, children 1-2 years of age should:";
          startIndex = textual.indexOf(start);
          endIndex = textual.indexOf(end, startIndex + start.length);
          String temp1=textual.substring(startIndex + start.length, endIndex);
          info1 = temp1;

          //For group 2

          start="In a 24-hour day, children 1-2 years of age should:";
          end="In a 24-hour day, children 3-4 years of age should:";
          startIndex = textual.indexOf(start);
          endIndex = textual.indexOf(end, startIndex + start.length);
          String temp2=textual.substring(startIndex + start.length, endIndex);
          info2 = temp2;

          //For group 3

          start="In a 24-hour day, children 3-4 years of age should:";
          end="Children and adolescents aged 5-17 years";
          startIndex = textual.indexOf(start);
          endIndex = textual.indexOf(end, startIndex + start.length);
          String temp3=textual.substring(startIndex + start.length, endIndex);
          info3 = temp3;

          //For group 4

          start="Children and adolescents aged 5-17 years";
          end="Adults aged 18–64 years";
          startIndex = textual.indexOf(start);
          endIndex = textual.indexOf(end, startIndex + start.length);
          String temp4=textual.substring(startIndex + start.length, endIndex);
          info4 = temp4;

          //For group 5

          start="Adults aged 18–64 years";
          end="Adults aged 65 years and above";
          startIndex = textual.indexOf(start);
          endIndex = textual.indexOf(end, startIndex + start.length);
          String temp5=textual.substring(startIndex + start.length, endIndex);
          info5 = temp5;

          //For group 6

          start="Adults aged 65 years and above";
          end="Pregnant and postpartum women";
          startIndex = textual.indexOf(start);
          endIndex = textual.indexOf(end, startIndex + start.length);
          String temp6=textual.substring(startIndex + start.length, endIndex);
          info6 = temp6;

          //For group 7

          start="Pregnant and postpartum women";
          end="People living with chronic conditions (hypertension, type 2 diabetes, HIV and cancer survivors) ";
          startIndex = textual.indexOf(start);
          endIndex = textual.indexOf(end, startIndex + start.length);
          String temp7=textual.substring(startIndex + start.length, endIndex);
          info7 = temp7;

          //For group 8

          start="People living with chronic conditions (hypertension, type 2 diabetes, HIV and cancer survivors) ";
          end="Children and adolescents living with disability:";
          startIndex = textual.indexOf(start);
          endIndex = textual.indexOf(end, startIndex + start.length);
          String temp8=textual.substring(startIndex + start.length, endIndex);
          info8 = temp8;

          //For group 9

          start="Children and adolescents living with disability:";
          end="Adults living with disability:";
          startIndex = textual.indexOf(start);
          endIndex = textual.indexOf(end, startIndex + start.length);
          String temp9=textual.substring(startIndex + start.length, endIndex);
          info9 = temp9;

          //For group 10

          start="Adults living with disability:";
          end="For more information World Health Organization";
          startIndex = textual.indexOf(start);
          endIndex = textual.indexOf(end, startIndex + start.length);
          String temp10=textual.substring(startIndex + start.length, endIndex);
          info10 = temp10;

          //-------End of Substring populating




        });
      }

    catch (e){ //
      setState(() {
        toOutput = "Cannot access data right now. Please Try again later: ";
        completed = true;
      });

    }
  }

  bool AllowedEditEmergency=false,grp1=false,grp2=false,grp3=false,grp4=false,grp5=false,grp6=false,grp7=false,grp8=false,grp9=false,grp10 =false;
  bool btns =false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fitness Tips",style:TextStyle(fontSize: 17)),
        backgroundColor: Colors.blue,
        centerTitle:true,
      ),
      body: Center(

          child: ListView(
            children: [
              //Map Content Goes here

              //TextButton(onPressed:  _funcTest, child: Text("Click Me for dta")),

              //Text("HEY"+toOutput.toString()),
              (completed)?Text("Activities: "):CircularProgressIndicator(),

              if (btns)
              new Column(
                children: [

                  TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),)),
                      child:
                      Text('Infants less than 1 year', style:TextStyle(color:Colors.white,fontSize: 17,)),
                      onPressed: () {

                        print('Infants less than 1 year');
                        setState(() {
                          grp1 = !grp1;
                        });

                      }
                  ),


                  if (grp1)
                    new Column(
                      children: [

                        Divider(
                            color: Colors.black
                        ),

                        Text(info1.toString(),textAlign: TextAlign.center,),

                      ],),


                  TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),)),
                      child:
                      Text('1-2 years of age', style:TextStyle(color:Colors.white,fontSize: 17,)),
                      onPressed: () {

                        print('1-2 years of age');
                        setState(() {
                          grp2 = !grp2;
                        });

                      }
                  ),


                  //Data for group 2
                  if (grp2)
                    new Column(
                      children: [

                        Divider(
                            color: Colors.black
                        ),

                        Text(info2.toString(),textAlign: TextAlign.center,),

                      ],),


                  TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),)),
                      child:
                      Text(' 3-4 years of age', style:TextStyle(color:Colors.white,fontSize: 17,)),
                      onPressed: () {

                        print('3-4 years of age');
                        setState(() {
                          grp3 = !grp3;
                        });

                      }
                  ),

                  //Data for group 3
                  if (grp3)
                    new Column(
                      children: [

                        Divider(
                            color: Colors.black
                        ),

                        Text(info3.toString(),textAlign: TextAlign.center,),

                      ],),

                  TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),)),
                      child:
                      Text('5-17 years of age', style:TextStyle(color:Colors.white,fontSize: 17,)),
                      onPressed: () {

                        print('5-17 years of age');
                        setState(() {
                          grp4 = !grp4;
                        });

                      }
                  ),

                  //Data for group 4
                  if (grp4)
                    new Column(
                      children: [

                        Divider(
                            color: Colors.black
                        ),

                        Text(info4.toString(),textAlign: TextAlign.center,),

                      ],),

                  TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),)),
                      child:
                      Text('18–64 years', style:TextStyle(color:Colors.white,fontSize: 17,)),
                      onPressed: () {

                        print('18–64 years');
                        setState(() {
                          grp5 = !grp5;
                        });

                      }
                  ),

                  //Data for group 5
                  if (grp5)
                    new Column(
                      children: [

                        Divider(
                            color: Colors.black
                        ),

                        Text(info5.toString(),textAlign: TextAlign.center,),

                      ],),

                  TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),)),
                      child:
                      Text('Aged 65 years and above', style:TextStyle(color:Colors.white,fontSize: 17,)),
                      onPressed: () {

                        print('aged 65 years and above');
                        setState(() {
                          grp6 = !grp6;
                        });

                      }
                  ),

                  //Data for group 6
                  if (grp6)
                    new Column(
                      children: [

                        Divider(
                            color: Colors.black
                        ),

                        Text(info6.toString(),textAlign: TextAlign.center,),

                      ],),

                  TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),)),
                      child:
                      Text('Pregnant/postpartum women', style:TextStyle(color:Colors.white,fontSize: 17,)),
                      onPressed: () {

                        print('Pregnant/postpartum women');
                        setState(() {
                          grp7 = !grp7;
                        });

                      }
                  ),

                  //Data for group 7
                  if (grp7)
                    new Column(
                      children: [

                        Divider(
                            color: Colors.black
                        ),

                        Text(info7.toString(),textAlign: TextAlign.center,),

                      ],),

                  TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),)),
                      child:
                      Text('People with chronic conditions', style:TextStyle(color:Colors.white,fontSize: 17,)),
                      onPressed: () {

                        print('People with chronic conditions');
                        setState(() {
                          grp8 = !grp8;
                        });

                      }
                  ),

                  //Data for group 8
                  if (grp8)
                    new Column(
                      children: [

                        Divider(
                            color: Colors.black
                        ),

                        Text(info8.toString(),textAlign: TextAlign.center,),

                      ],),

                  TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),)),
                      child:
                      Text('Adolescents living with disability', style:TextStyle(color:Colors.white,fontSize: 17,)),
                      onPressed: () {

                        print('adolescents living with disability');
                        setState(() {
                          grp9 = !grp9;
                        });

                      }
                  ),

                  //Data for group 9
                  if (grp9)
                    new Column(
                      children: [

                        Divider(
                            color: Colors.black
                        ),

                        Text(info9.toString(),textAlign: TextAlign.center,),

                      ],),

                  TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),)),
                      child:
                      Text('Adults living with disability', style:TextStyle(color:Colors.white,fontSize: 17,)),
                      onPressed: () {

                        print('Adults living with disability');
                        setState(() {
                          grp10 = !grp10;
                        });

                      }
                  ),

                  //Data for group 10
                  if (grp10)
                    new Column(
                      children: [

                        Divider(
                            color: Colors.black
                        ),

                        Text(info10.toString(),textAlign: TextAlign.center,),

                      ],),




                ]
              ),




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
// }

// _funcTest() async {
//   final webScraper = WebScraper('https://www.who.int');
//   if (await webScraper.loadWebPage('/news-room/fact-sheets/detail/physical-activity')) {
//     List<Map<String, dynamic>> elements = webScraper.getElement('article.sf-detail-body-wrapper', ['title']);
//
//     print(elements[0]);
//   }
// }

