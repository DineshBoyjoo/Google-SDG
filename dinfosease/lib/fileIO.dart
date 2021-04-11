import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Storage{

  Future<String> get _localPath async{
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }


  Future<File> get _localFile async {
    final path = await _localPath;
    return File("$path/contactList.txt");
  }

  Future<String> readContact() async {
    try{
      final file =  await _localFile;
      String contents = await file.readAsString();
      return contents;
    }catch(e){
      return "Error";
    }


  }

  Future<File> writeContact(String data) async {
    final file = await _localFile;
    return file.writeAsString('$data');
  }
}