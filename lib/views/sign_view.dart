
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_doc/controller/auth_controller.dart';
import 'package:hello_doc/decor/txtfield.dart';
import 'package:hello_doc/views/home.dart';
import 'package:hello_doc/views/login_view.dart';
class SignView extends StatelessWidget{

const SignView({super.key});

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
             CustomTextfield(hint: "Name",textcontroller: controller.fullnameController,),
             SizedBox(height: 10,),
             CustomTextfield(hint: "Email",textcontroller: controller.emailController,),
             SizedBox(height: 10,),
             CustomTextfield(hint: "Password",textcontroller: controller.passwordController,),
             SizedBox(height: 10,),
             ElevatedButton(onPressed: () async{ 
              await controller.signupUser();
             if(controller.userCredential!=null){
              Navigator.push(context,MaterialPageRoute(builder: (context)=> Home() ));

             }
             
             }, child: Text("Signup")),
             SizedBox(height: 10,),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 GestureDetector(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginView() ));
                  } ,
                  child: Text("Now Login")),
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