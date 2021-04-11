import 'package:flutter/material.dart';
import 'package:dinfosease/globalvar.dart';
import 'package:dinfosease/functions.dart';
import 'package:dinfosease/fileIO.dart';

class disease extends StatefulWidget {

  //Instance of Storage used to read Phone numbers to be sent as parameter to function messageContacts()
  final Storage storage = Storage();
  final int location; //Array Location to access DiseaseName and Medias
  // receive data from the dashboard as a parameter
  disease({Key key, @required this.location}) : super(key: key);
  // receive data from the FirstScreen as a parameter

  @override
  MydiseaseState createState() => MydiseaseState();
}

class MydiseaseState extends State<disease> {

  @override
  String compon;
  void initState(){ //To obtain phone numbers from file contactList.txt
    widget.storage.readContact().then((String value)
    {
      setState(() {
        compon = value;
      });
    }

    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(diseaseName[widget.location.toInt()],style:TextStyle(fontSize: 17)),
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

                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(mediaURL[widget.location.toInt()]),
                        //whatever image you can put here
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  //Image.network(mediaURL[widget.location.toInt()],width:50,height:50),
                  Column(children: [
                    Text("Communicable Disease",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
                    Text(diseaseName[widget.location.toInt()],style: TextStyle(fontSize: 15),),
                    Text(activeCountDisease[widget.location.toInt()].toString()+" Active Cases",style: TextStyle(fontSize: 15),),
                    Text(DeathCountDisease[widget.location.toInt()].toString()+" Death till now",style: TextStyle(fontSize: 15),),
                    Text(RecoverCountDisease[widget.location.toInt()].toString()+" Recovered till now",style: TextStyle(fontSize: 15),),
                  ],),
                ],
              ),
              Divider(
                  color: Colors.black
              ),
              Text("Symptoms",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
              SizedBox(height: 5),
              if(widget.location.toInt()==0)
                Text(symp1,textAlign: TextAlign.center,style: TextStyle(fontSize: 15),),

              if(widget.location.toInt()==1)
                Text(symp2,textAlign: TextAlign.center,style: TextStyle(fontSize: 15),),

              if(widget.location.toInt()==2)
                Text(symp3,textAlign: TextAlign.center,style: TextStyle(fontSize: 15),),

              if(widget.location.toInt()==3)
                Text(symp4,textAlign: TextAlign.center,style: TextStyle(fontSize: 15),),
              SizedBox(height: 15),

              Divider(
                  color: Colors.black
              ),

              Text("Treatment",textAlign: TextAlign.center, style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
              //Text("If any treatment, place here"),
              SizedBox(height: 15),
              if(widget.location.toInt()==0)
                Text(treat1,textAlign: TextAlign.center,style: TextStyle(fontSize: 15),),

              if(widget.location.toInt()==1)
                Text(treat2,textAlign: TextAlign.center,style: TextStyle(fontSize: 15),), //Use treat2 when extending app to allow treatments to be fetched from JSON

              if(widget.location.toInt()==2)
                Text(treat3,textAlign: TextAlign.center,style: TextStyle(fontSize: 15),), //Use treat3 when extending app to allow treatments to be fetched from JSON

              if(widget.location.toInt()==3)
                Text(treat4,textAlign: TextAlign.center,style: TextStyle(fontSize: 15),), //Use treat4 when extending app to allow treatments to be fetched from JSON

              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {

                      if (states.contains(MaterialState.focused))
                        return Colors.white.withOpacity(0.2);
                      else {
                        return null;
                      }
                    },
                  ),

                ),
                onPressed: () =>
                {
                  findNearestHealthCenter()  },

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

                      if (states.contains(MaterialState.focused))
                        return Colors.white.withOpacity(0.2);
                      else {
                        return null;
                      }
                    },
                  ),

                ),
                onPressed: () =>
                {
                  callHotlineHealth()  },

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

                      if (states.contains(MaterialState.focused))
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
                      "*THIS IS AN AUTOMATED MESSAGE FROM DinfoSEASE Application* I need medical assistance right now and I am suspicious about "+diseaseName[widget.location.toInt()]+" disease. Please Call me as soon as possible."
                      ,compon,emergencyContact
                  )
                },

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