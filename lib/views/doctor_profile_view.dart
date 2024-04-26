
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hello_doc/views/appointment_view.dart';

class DoctorProfile extends StatelessWidget {
  final DocumentSnapshot doc;
  const DoctorProfile({super.key,required this.doc});

  @override
  Widget build(BuildContext context) {
    String docName = doc['docName'];
    String docCategory = doc['docCategory'];

    return Scaffold(
      appBar: AppBar(
        title: Text(doc['docName']),
      ),

  body:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(docName),
          Text(docCategory),
        ],
      ),

 bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle button press
                   Navigator.push(context,MaterialPageRoute(builder: (context)=> Appointment(
                    docId: doc['docId'],
                    docName: doc['docName']
                   ) ));

                },
                child: const Text('Book appointment'),
              ),
            ],
          ),
        ),    );
  }
}