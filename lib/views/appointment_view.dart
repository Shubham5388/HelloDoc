
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_doc/controller/appointment_controller.dart';
import 'package:hello_doc/decor/txtfield.dart';

class Appointment extends StatelessWidget {
    final String docId;
  const Appointment({super.key,required this.docId, required docName});

  @override
  Widget build(BuildContext context) {
     var controller= Get.put(AppointmentController());


    return  Scaffold(
      appBar: AppBar(
        title: Text("Doctor"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10) ,
        child: Column(
          children: [
            Text("BOOK"),
            CustomTextfield(hint: "select day",textcontroller: controller.appDayController,),
           CustomTextfield(hint: "name",textcontroller: controller.appNameController,),
            CustomTextfield(hint: "message",textcontroller: controller.appMessageController,),
          ],
        ),
      ),





      bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  // Handle button press
                 await controller.bookAppointment(docId,context);
                   
                },
                child: const Text('Book appointment'),
              ),
            ],
          ),
        ),    );
  }
}