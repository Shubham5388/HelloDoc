
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_doc/controller/auth_controller.dart';
import 'package:hello_doc/decor/txtfield.dart';
import 'package:hello_doc/views/home.dart';
import 'package:hello_doc/views/show_appt_view.dart';
import 'package:hello_doc/views/sign_view.dart';


class LoginView extends StatefulWidget{


const LoginView({super.key});

  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<LoginView> {
var isDoctor = false;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(child: Container(color: Colors.amber,)),//here inside insert a doctor logo
            Expanded(child: Container(color: Color.fromARGB(255, 218, 103, 8),
            child:  Form(
              child: Column(
                children: [
              CustomTextfield(hint: "Email",textcontroller:controller.emailController,),
             SizedBox(height: 10,),
              CustomTextfield(hint: "Password",textcontroller: controller.passwordController,),
             SizedBox(height: 10,),
             SwitchListTile(value: isDoctor, onChanged: (newValue){
  setState(() {
    isDoctor=newValue;
  });
},
title: Text("Sign in as Doctor"),),

            SizedBox(height: 10,),
             ElevatedButton(onPressed: ()async{ 
              await controller.loginUser();
              if(controller.loginUser()!=null){
              
              if(isDoctor){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>const ShowAppointment() ));
              }
             else{
              Navigator.push(context,MaterialPageRoute(builder: (context)=>const Home() ));
             }
              }

              }, child: Text("login")),
             SizedBox(height: 10,),

             Row(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 GestureDetector(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>SignView() ));
                  } ,
                  child: Text("SignUp")),
               ],
             )


              
                ],
              ),
              ),
            )
            )
          ],
        )
      ),
    );
  }
    
}

