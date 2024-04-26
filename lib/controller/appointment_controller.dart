import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentController extends GetxController{
  var isLoading = false.obs;

  var appDayController = TextEditingController();
  var appNameController = TextEditingController();
  var appMessageController = TextEditingController();
 
  bookAppointment(String docId, BuildContext context) async{
    isLoading(true);

  var store = FirebaseFirestore.instance.collection('appointments').doc();
await store.set({
  'appBy' : FirebaseAuth.instance.currentUser?.uid,
  'appDay' : appDayController.text,
  'appName': appNameController.text,
  'appMsg':appMessageController.text,
  'appWith': docId,

});
isLoading(false);
//const AlertDialog(title: Text("Booked") );
  }

Future<QuerySnapshot<Map<String,dynamic>>> getAppointment(bool isDoctor){
  if(isDoctor){
return FirebaseFirestore.instance.collection('appointments')
.where('appWith',isEqualTo: FirebaseAuth.instance.currentUser?.uid).get();
  }
  else{
  return FirebaseFirestore.instance.collection('appointments')
  .where('appBy',isEqualTo: FirebaseAuth.instance.currentUser?.uid).get();
  }
}
}