import 'dart:ui';
import 'package:contact_app/Models/Contact.dart';
import 'package:flutter/material.dart';

class AddContact extends StatefulWidget {
  final Contact? contact;
  const AddContact({
    Key? key,
    this.contact,
  }) : super(key: key);

  @override
  _AddContactState createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.contact != null
            ? Text("Modifier eP Contact")
            : Text("Ajouter eP Contact"),
      ),
      body: Form(
          child: ListView(
        children: [
          SizedBox(height: 20.0),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Nom et Prenoms",
              hintStyle: TextStyle(color: Colors.black),
              prefixIcon: Icon(Icons.person),
            ),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Telephone",
              hintStyle: TextStyle(color: Colors.black),
              prefixIcon: Icon(Icons.phone),
            ),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Email",
              hintStyle: TextStyle(color: Colors.black),
              prefixIcon: Icon(Icons.email),
            ),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Description du contact",
              hintStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(
                  color: Colors.blueAccent,
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 50.0,
              alignment: Alignment.center,
              width: double.infinity,
              child: widget.contact != null
                  ? Text(
                      "Modifier",
                      style: TextStyle(color: Colors.black),
                    )
                  : Text(
                      "Enregister",
                      style: TextStyle(color: Colors.black),
                    ),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          )
        ],
      )),
    );
  }
}
