import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AuthController extends GetxController{

var fullnameController = TextEditingController();
var emailController = TextEditingController();
var passwordController = TextEditingController();

  UserCredential? userCredential;

loginUser() async{
  userCredential= await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);

}


signupUser() async {
userCredential= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
// ignore: unnecessary_null_comparison
if(userCredential != null){
  await storeUserData(userCredential!.user!.uid,fullnameController.text,emailController.text);
}
}

storeUserData(String uid,String fullname,String email) async {
  var store = FirebaseFirestore.instance.collection('users').doc();
  await store.set({'fullname':fullname,'email':email});
}
}