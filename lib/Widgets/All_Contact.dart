import 'package:contact_app/Models/Contact.dart';
import 'package:contact_app/Screens/AddContact.dart';
import 'package:contact_app/Services/SqfLite_helper.dart';
import 'package:contact_app/Widgets/Contact_card.dart';
import 'package:flutter/material.dart';
//import 'package:sqflite/sqflite.dart';

class AllContact extends StatefulWidget {
  const AllContact({Key? key}) : super(key: key);

  @override
  _AllContactState createState() => _AllContactState();
}

class _AllContactState extends State<AllContact> {
  SqfLiteHelper _helper = SqfLiteHelper();
  bool loading = true;
  List<Contact> contactList = [];
  int? nContacts = 0;

  Future<void> initialize() async {
    List<Contact>? cL = await _helper.getAllContact();
    setState(() {
      contactList = cL ?? [];
      nContacts = cL?.length;
      loading = false;
    });
  }

  Widget getChild() {
    if (loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      if (nContacts == 0) {
        return Center(
          child: Text("Vous n'avez encore aucun conatct"),
        );
      } else {
        return ListView.separated(
          itemCount: nContacts ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
                child: ContactCard(contact: contactList[index]),
                key: ValueKey<dynamic>(contactList[index]),
                onDismissed: (DismissDirection direction) {
                  setState(() {
                    contactList.removeAt(index);
                  });
                });
          },
          separatorBuilder: (context, index) => SizedBox(height: 15.0),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddContact(),
                ));
          }),
      body: Column(
        children: [],
      ),
    );
  }
}
