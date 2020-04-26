import 'dart:html';

import 'package:sqflite/sqflite.dart';

final String idColumn = "id_contact";
final String nameColumn = "name";
final String emailColumn = "email";
final String phoneColumn = "phone";
final String imgColumn = "img";


class ContactHelper{

}


class Contact{

  int id;
  String name;
  String email;
  String phone;
  String img;

  //Construtor chama from map
  Contact.fromMap(Map map){
    this.id = map[idColumn];
    this.name = map[nameColumn];
    this.email = map[emailColumn];
    this.phone = map[phoneColumn];
    this.img = map[imgColumn];
  }

  Map toMap(){
    Map<String,dynamic> map ={
      nameColumn: name,
      emailColumn: email,
      phoneColumn: phone,
      imgColumn: img,
    };
    if (id != null){
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString(){
    return "Contact(id:$id, name:$name, email:$email, phone:$phone, img:$img)";
  }

}