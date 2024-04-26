import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_doc/controller/appointment_controller.dart';
import 'package:hello_doc/views/appt_details.dart';

class ShowAppointment extends StatelessWidget {

  final bool isDoctor;
  const ShowAppointment({super.key, this.isDoctor=false});

  @override
  Widget build(BuildContext context) {
   var controller = Get.put(AppointmentController());
    return  Scaffold(
      appBar: AppBar(
        title: Text("Appointments"),
      ),
      body: FutureBuilder(future: controller.getAppointment(isDoctor), 
      builder:(BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot ) {
if(!snapshot.hasData){
  return Center(child: CircularProgressIndicator(),);
}

else{ 
  var data = snapshot.data?.docs;
  return ListView.builder(itemCount: data?.length ?? 0,itemBuilder: (BuildContext context,int index){
       return GestureDetector(
        onTap: () {
          Navigator.push(context,MaterialPageRoute(builder: (context)=> AppointmentDetails(doc: data![index],) ));

        },
        
         child: ListTile(
              leading: Icon(Icons.boy_rounded),
              title: Text(data?[index][isDoctor ? 'appWithName':'appName']),
              subtitle: Text(data?[index]['appDay']),
            
         ),
       );
      }
      );
      } 
  }
  )
  );
  }
}