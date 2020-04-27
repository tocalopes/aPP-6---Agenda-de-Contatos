import 'dart:io';

import 'package:agenda_contatos/helpers/contact_helper.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  
  final Contact contact;

  

  ContactPage({this.contact});//{} indica que o parâmetro é opcional

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  
  bool _userEdited = false;
  Contact _editedContact;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.contact == null) {
      _editedContact = Contact(); 
    }else{
       _editedContact = Contact.fromMap(widget.contact.toMap());
       _nameController.text = _editedContact.name;
       _emailController.text = _editedContact.email;
       _phoneController.text = _editedContact.phone;
    }
      
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.red,
        title:Text(_editedContact.name ?? "Novo Contato"),
        centerTitle: true,
      ),
      floatingActionButton:FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: null,
        backgroundColor: Colors.red,
      ),
      body:SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child:Column(
          children: <Widget>[
            GestureDetector(
              child:Container(
                width: 140,
                height:140,                
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image:DecorationImage(
                    image:_editedContact.img != null ? FileImage(File(_editedContact.img)): 
                    AssetImage("images/person.png"),
                  ),
                ),
              ),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Nome"),
              onChanged: (text){
                _userEdited = true;
                setState(() {                    
                    _editedContact.name = text;
                });
              },
            ),
            TextField(
              controller:_emailController,
              decoration: InputDecoration(labelText: "Email"),
              onChanged: (text){
                _userEdited = true;
                _editedContact.name = text;
              },
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller:_phoneController,
              decoration: InputDecoration(labelText:"Phone"),
              onChanged: (text){
                _userEdited = true;
                _editedContact.phone = text;
              },
              keyboardType: TextInputType.phone,
            ),
          ],
        ),
      ),
    );
  }
}