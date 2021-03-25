import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:dinfosease/functions.dart';
import 'package:dinfosease/fileIO.dart';
import 'package:dinfosease/globalvar.dart';
import 'package:dinfosease/getstart.dart';


  var _phoneNum = ""; //Global Var used to capture input data and write to text file

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
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'DinfoSEASE Welcome Page'),

        debugShowCheckedModeBanner: false,
      );
    }
  }

  class MyHomePage extends StatefulWidget {
    final Storage storage = Storage();
    MyHomePage({Key key, this.title}) : super(key: key);
    final String title;

    //Storage Instance to Write to file in case user submit value
    @override

    _MyHomePageState createState() => _MyHomePageState();
  }

  class _MyHomePageState extends State<MyHomePage> {
      final PhoneController = new TextEditingController();
      String compon = "";
      bool AllowedEditEmergency =false;

      @override

      void initState(){ //To obtain phone numbers from file contactList.txt
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
                SizedBox(height: 30),

                SlideInLeft(child:
                TextButton(
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),)),
                    child:
                    Text(' Go to Dashboard ', style:TextStyle(color:Colors.white,fontSize: 23,)),
                    onPressed: () {
                      print('User want to get Started!');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => getStart()),
                      );
                    }
                ),),

                SizedBox(height: 10),

                SlideInLeft(child:
                TextButton(
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),)),
                    child:
                    Text(' Send SOS Message ', style:TextStyle(color:Colors.white,fontSize: 23,)),
                    onPressed: () {
                      print('User wants to send sos');
                      messageContacts(
                          "*THIS IS AN AUTOMATED MESSAGE FROM DinfoSEASE Application* I need medical help right now. Please contact me immediately."
                              ,compon,emergencyContact
                      );
                    }
                ),),

                SizedBox(height: 10),



                SlideInLeft(child:
                TextButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),)),
                    child:
                    Text(' Toggle Emergency List ', style:TextStyle(color:Colors.white,fontSize: 23,)),
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
