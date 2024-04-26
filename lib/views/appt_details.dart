import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AppointmentDetails extends StatelessWidget {

final DocumentSnapshot doc;
  const AppointmentDetails({super.key,required this.doc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("DOC name"),
      ),
      body:  Padding(
        padding: EdgeInsets.all(10) ,
        child: Column(
          children: [
            Text(doc['appName']),
           Text(doc['appDay']),
            Text(doc['appMsg']),

          ],
        ),
      ),
    );
  }
}