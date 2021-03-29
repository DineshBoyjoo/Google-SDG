 import 'dart:ffi';

String country = "";
final String population = "1.2M";
//final String flag = "https://media.gettyimages.com/photos/national-flag-of-the-republic-of-mauritius-picture-id645009405?s=612x612";
  String flag = "";
var diseaseName=["COVID-19","Tuberculosis","Malaria","Flu"];
var mediaURL = [
  'https://www.foundationhealth.org/.api2/binaries/0PhOWfdecz/thumbnails/Icon-germ-04.png?width=300',
  'https://image.flaticon.com/icons/png/512/773/773895.png',
  'https://thumbs.dreamstime.com/b/malaria-mosquito-icon-vector-outline-illustration-malaria-mosquito-icon-vector-outline-malaria-mosquito-sign-isolated-contour-168860447.jpg',
  'https://thumbs.dreamstime.com/z/sneeze-common-cold-flu-icon-as-eps-file-190899647.jpg'];
var activeCountDisease = [ 10 ,11,12,13 ];
String warningBannerData = "40 New Covid Cases today 21/03/2021";
var emergencyContact = []; //Serves as broadcast Address for Private emergency Message. Fill in with numbers if dev wishes to broadcast without adding number to interface


class symptoms {

  List ListOfsymptoms = [  ];

  void addSymptom(String s){
    ListOfsymptoms.add(s);
  }

  String dispAll(){
    String returning = "";
    for(int y=0;y<ListOfsymptoms.length;y++){
      returning=returning+ListOfsymptoms[y]+"\n";
    }

    return returning;
  }

 }


