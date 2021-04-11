import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:web_scraper/web_scraper.dart';


var populationCountFromJson;
var death1,death2,death3,death4;
var recover1,recover2,recover3,recover4;

// String symp1 = 'symp1 \n symp2\nsymp3\nsymp4';
// String symp2 = 'symp1';
// String symp3 = 'symp1\nsymp2';
// String symp4 = 'symp1\nsymp2\nsymp3\nsymp4';

String symp1 = ' ';
String symp2 = ' ';
String symp3 = ' ';
String symp4 = ' ';

// String treat1 = 'treat1 \n treat2\ntreat3\ntreat4';
// String treat2 = 'treat1';
// String treat3 = 'treat1\ntreat2';
// String treat4 = 'treat1\ntreat2\ntreat3\ntreat4';

//Treatment will be an extension in the near future. With proper data mining and web scraping from trusted source.
String treat1 = 'Consult Your Doctor';
String treat2 = treat1;
String treat3 = treat1;
String treat4 = treat1;


var diseaseName1 = " " ,diseaseName2 = " ",diseaseName3  = " ",diseaseName4 = " ";
var diseaseCase1 ,diseaseCase2,diseaseCase3,diseaseCase4;
var dURL1='', dURL2='', dURL3='', dURL4=''; //Storing icons of diseases

fetchData() async{

  //var jsonData = '{"d1":{"name":"COVID-19","Total Cases":1191,"Deaths":12,"Recovered":750,"Current-Active":441,"symptome":"headache, loss of smell and taste","Population":1265711,"ico":"https://www.foundationhealth.org/.api2/binaries/0PhOWfdecz/thumbnails/Icon-germ-04.png?width=300"},"d2":{"name1":"Malaria","tcases1":18,"death1":0,"rec1":3,"actcases1":15,"sympt1":"shaking chills, headache, muscle aches, tiredness","ico1":"https://thumbs.dreamstime.com/b/malaria-mosquito-icon-vector-outline-illustration-malaria-mosquito-icon-vector-outline-malaria-mosquito-sign-isolated-contour-168860447.jpg"},"d3":{"name2":"Tuberculosis","tcases2":18,"death2":0,"rec2":3,"actcases2":5,"sympt2":"Fever, Night sweats, Loss of appetite, unintentional weight loss","ico2":"https://image.flaticon.com/icons/png/512/773/773895.png"},"d4":{"name3":" ","tcases3":0,"death3":0,"rec3":0,"actcases3":0,"sympt3":"0","ico3":"https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/Solid_white.svg/768px-Solid_white.svg.png"}}';

  //var response = await http.get(Uri.parse('https://covdata.firebaseio.com/-MXAV-gyzLTaTAz9yzXG.json')); //For Google Cloud Database(Cannot use because Downgraded)
  var response = await http.get(Uri.parse('https://dinfosease.000webhostapp.com/dataex.json')); //Moved to 000webhost
  //print(response.body);
  var datas = json.decode(response.body);
  //var datas = json.decode(jsonData);
  var res = DataFetch.fromJson(datas);

  // print("Disease 1 Name: ${res.d1.name} With ${res.d1.currentActive} Active cases");
  // print("Disease 2 Name: ${res.d2.name1} With ${res.d2.actcases1} Active cases");
  // print("Disease 3 Name: ${res.d3.name2} With ${res.d3.actcases2} Active cases");
  // print("Disease 4 Name: ${res.d4.name3} With ${res.d4.actcases3} Active cases");

  //Populating Disease Names in array
  diseaseName1 = res.d1.name;
  diseaseName2 = res.d2.name1;
  diseaseName3 = res.d3.name2;
  diseaseName4  = res.d4.name3;


  //Populating Disease active cases
  diseaseCase1 = res.d1.currentActive;
  diseaseCase2 = res.d2.actcases1;
  diseaseCase3 = res.d3.actcases2;
  diseaseCase4 = res.d4.actcases3;


  //Populating Image Ico of diseases


  dURL1 = res.d1.ico;
  dURL2 = res.d2.ico1;
  dURL3 = res.d3.ico2;
  dURL4 = res.d4.ico3;

  //Populating Symptoms

  //str1.replaceAll('World','ALL')
  symp1 = res.d1.symptome;
  symp2 = res.d2.sympt1;
  symp3 = res.d3.sympt2;
  symp4 = res.d4.sympt3;

  //Replacing , char to Next line \n
  symp1=symp1.replaceAll(',', '\n');
  symp2=symp2.replaceAll(',', '\n');
  symp3=symp3.replaceAll(',', '\n');
  symp4=symp4.replaceAll(',', '\n');

  //Populating death array
  death1 = res.d1.deaths;
  death2 = res.d2.death1;
  death3 = res.d3.death2;
  death4 = res.d4.death3;
  //Populating recovery cases
  recover1 = res.d1.recovered;
  recover2 = res.d2.rec1;
  recover3 = res.d3.rec2;
  recover4 = res.d4.rec3;


  //Population Data
  populationCountFromJson=res.d1.population;




}

//Edit variable from line 3 to line 20 only for populating data
//----------------------------------------------------------------------------------
//final String population = "1.2M";
final String population = populationCountFromJson.toString();

//var diseaseName=["COVID-19","Tuberculosis","Malaria","Flu"]; //ORIGINAL
var diseaseName=[diseaseName1,diseaseName2,diseaseName3,diseaseName4];
var DeathCountDisease=[death1,death2,death3,death4];
var RecoverCountDisease=[recover1,recover2,recover3,recover4];

// var mediaURL = [
//   'https://www.foundationhealth.org/.api2/binaries/0PhOWfdecz/thumbnails/Icon-germ-04.png?width=300',
//   'https://image.flaticon.com/icons/png/512/773/773895.png',
//   'https://thumbs.dreamstime.com/b/malaria-mosquito-icon-vector-outline-illustration-malaria-mosquito-icon-vector-outline-malaria-mosquito-sign-isolated-contour-168860447.jpg',
//   'https://thumbs.dreamstime.com/z/sneeze-common-cold-flu-icon-as-eps-file-190899647.jpg'
// ]; //ORIGINAL

var mediaURL = [
  dURL1,
  dURL2,
  dURL3,
  dURL4
];


//var activeCountDisease = [ 10 ,11,12,13 ]; //ORIGINAL

var activeCountDisease = [ diseaseCase1 ,diseaseCase2,diseaseCase3,diseaseCase4 ];



//----------------------------------------------------------------------------------


String flag = "";
var emergencyContact = []; //Serves as broadcast Address for Private emergency Message. Fill in with numbers if dev wishes to broadcast without adding number to interface
String warningBannerData = "40 New Covid Cases today 21/03/2021"; //*
String country = "";








//Class used for JSON


class DataFetch {
  int currentActive;
  int deaths;
  int population;
  int recovered;
  int totalCases;
  D1 d1;
  D2 d2;
  D3 d3;
  D4 d4;

  DataFetch(
      {this.currentActive,
        this.deaths,
        this.population,
        this.recovered,
        this.totalCases,
        this.d1,
        this.d2,
        this.d3,
        this.d4});

  DataFetch.fromJson(Map<String, dynamic> json) {
    currentActive = json['Current-Active'];
    deaths = json['Deaths'];
    population = json['Population'];
    recovered = json['Recovered'];
    totalCases = json['Total Cases'];
    d1 = json['d1'] != null ? new D1.fromJson(json['d1']) : null;
    d2 = json['d2'] != null ? new D2.fromJson(json['d2']) : null;
    d3 = json['d3'] != null ? new D3.fromJson(json['d3']) : null;
    d4 = json['d4'] != null ? new D4.fromJson(json['d4']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Current-Active'] = this.currentActive;
    data['Deaths'] = this.deaths;
    data['Population'] = this.population;
    data['Recovered'] = this.recovered;
    data['Total Cases'] = this.totalCases;
    if (this.d1 != null) {
      data['d1'] = this.d1.toJson();
    }
    if (this.d2 != null) {
      data['d2'] = this.d2.toJson();
    }
    if (this.d3 != null) {
      data['d3'] = this.d3.toJson();
    }
    if (this.d4 != null) {
      data['d4'] = this.d4.toJson();
    }
    return data;
  }
}

class D1 {
  int currentActive;
  int deaths;
  int population;
  int recovered;
  int totalCases;
  String ico;
  String name;
  String symptome;

  D1(
      {this.currentActive,
        this.deaths,
        this.population,
        this.recovered,
        this.totalCases,
        this.ico,
        this.name,
        this.symptome});

  D1.fromJson(Map<String, dynamic> json) {
    currentActive = json['Current-Active'];
    deaths = json['Deaths'];
    population = json['Population'];
    recovered = json['Recovered'];
    totalCases = json['Total Cases'];
    ico = json['ico'];
    name = json['name'];
    symptome = json['symptome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Current-Active'] = this.currentActive;
    data['Deaths'] = this.deaths;
    data['Population'] = this.population;
    data['Recovered'] = this.recovered;
    data['Total Cases'] = this.totalCases;
    data['ico'] = this.ico;
    data['name'] = this.name;
    data['symptome'] = this.symptome;
    return data;
  }
}

class D2 {
  int actcases1;
  int death1;
  String ico1;
  String name1;
  int rec1;
  String sympt1;
  int tcases1;

  D2(
      {this.actcases1,
        this.death1,
        this.ico1,
        this.name1,
        this.rec1,
        this.sympt1,
        this.tcases1});

  D2.fromJson(Map<String, dynamic> json) {
    actcases1 = json['actcases1'];
    death1 = json['death1'];
    ico1 = json['ico1'];
    name1 = json['name1'];
    rec1 = json['rec1'];
    sympt1 = json['sympt1'];
    tcases1 = json['tcases1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['actcases1'] = this.actcases1;
    data['death1'] = this.death1;
    data['ico1'] = this.ico1;
    data['name1'] = this.name1;
    data['rec1'] = this.rec1;
    data['sympt1'] = this.sympt1;
    data['tcases1'] = this.tcases1;
    return data;
  }
}

class D3 {
  int actcases2;
  int death2;
  String ico2;
  String name2;
  int rec2;
  String sympt2;
  int tcases2;

  D3(
      {this.actcases2,
        this.death2,
        this.ico2,
        this.name2,
        this.rec2,
        this.sympt2,
        this.tcases2});

  D3.fromJson(Map<String, dynamic> json) {
    actcases2 = json['actcases2'];
    death2 = json['death2'];
    ico2 = json['ico2'];
    name2 = json['name2'];
    rec2 = json['rec2'];
    sympt2 = json['sympt2'];
    tcases2 = json['tcases2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['actcases2'] = this.actcases2;
    data['death2'] = this.death2;
    data['ico2'] = this.ico2;
    data['name2'] = this.name2;
    data['rec2'] = this.rec2;
    data['sympt2'] = this.sympt2;
    data['tcases2'] = this.tcases2;
    return data;
  }
}

class D4 {
  int actcases3;
  int death3;
  String ico3;
  String name3;
  int rec3;
  String sympt3;
  int tcases3;

  D4(
      {this.actcases3,
        this.death3,
        this.ico3,
        this.name3,
        this.rec3,
        this.sympt3,
        this.tcases3});

  D4.fromJson(Map<String, dynamic> json) {
    actcases3 = json['actcases3'];
    death3 = json['death3'];
    ico3 = json['ico3'];
    name3 = json['name3'];
    rec3 = json['rec3'];
    sympt3 = json['sympt3'];
    tcases3 = json['tcases3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['actcases3'] = this.actcases3;
    data['death3'] = this.death3;
    data['ico3'] = this.ico3;
    data['name3'] = this.name3;
    data['rec3'] = this.rec3;
    data['sympt3'] = this.sympt3;
    data['tcases3'] = this.tcases3;
    return data;
  }
}





