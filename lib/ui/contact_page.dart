import 'package:agenda_contatos/helpers/contact_helper.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  
  final Contact contact;
  ContactPage({this.contact});//{} indica que o parâmetro é opcional

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  
  Contact _editedContact;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    (widget.contact == null) ? _editedContact = Contact() : _editedContact = Contact.fromMap(widget.contact.toMap());
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
    );
  }
}