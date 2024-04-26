import 'package:flutter/material.dart';
import 'package:hello_doc/views/home_view.dart';
import 'package:hello_doc/views/login_view.dart';
import 'package:hello_doc/views/setting_view.dart';
import 'package:hello_doc/views/show_appt_view.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState()=> _HomeState();
}

class _HomeState extends State<Home> {

int selectedIndex=0;
List ScreenList=[
  HomeView(),
  Container(),
  ShowAppointment(),
  LoginView(),
   const Settings(),

];


  @override
  Widget build(BuildContext context){
return Scaffold(
  body: ScreenList.elementAt(selectedIndex),
  bottomNavigationBar: BottomNavigationBar(
    backgroundColor: const Color.fromARGB(221, 203, 183, 183),
    type: BottomNavigationBarType.fixed,
    currentIndex: selectedIndex,
    onTap: (value){
      setState(() {
        selectedIndex = value;
      });
    }
    ,
  items: const [
    BottomNavigationBarItem(icon: Icon(Icons.access_alarm),label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.access_alarm),label: "Types"),
    BottomNavigationBarItem(icon: Icon(Icons.access_alarm),label: "Appointments"),
    BottomNavigationBarItem(icon: Icon(Icons.access_alarm),label: "Doctor"),
    BottomNavigationBarItem(icon: Icon(Icons.access_alarm),label: "Settings"),
                                                             
    
  ],),
);
  }

   
}