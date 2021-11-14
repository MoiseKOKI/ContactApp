import 'package:contact_app/Widgets/All_Contact.dart';
import 'package:contact_app/Widgets/Favorites_Contact.dart';
import 'package:flutter/material.dart';

class ContactHome extends StatelessWidget {
  const ContactHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Contact App"),
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(Icons.people),
              text: "All",
            ),
            Tab(
              icon: Icon(Icons.star),
              text: "Favoris",
            )
          ]),
        ),
        body: TabBarView(
          children: [
            AllContact(),
            FavoriteContact(),
          ],
        ),
      ),
    );
  }
}
