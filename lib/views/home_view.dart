import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_doc/controller/home_controller.dart';
import 'package:hello_doc/decor/txtfield.dart';
import 'package:hello_doc/list.dart';
import 'package:hello_doc/views/doctor_profile_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
var controller= Get.put(HomeController());

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 64, 179, 255),
      appBar: AppBar(title: const Text("welcome"),
      ),

      body: Column(
        children: [
          Container(
            height: 100,
            color: Colors.amber,
            child: CustomTextfield(hint: "Search",),
          ),

          SizedBox(height: 10,),

        SizedBox(
          height: 100,
          child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: 6,itemBuilder: (BuildContext context, int index){
           return Container(
            padding: EdgeInsets.all(12),
            margin: const EdgeInsets.all( 8),
            color: Color.fromARGB(255, 202, 163, 163),
            child:  Column(children: [
              Icon(iconList[index],size: 30,),
              SizedBox(height: 5,),
              Text(iconTitleList[index])
            ],),
           );
          },
        )
        ),


        SizedBox(height: 10,),

Text("Popular Doctors"),

FutureBuilder<QuerySnapshot>(future: controller.getDoctorList(), 
builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot ){
if(!snapshot.hasData){
  return const Center(
    child: CircularProgressIndicator(),
  );
}
else{
  var data = snapshot.data?.docs;
  return SizedBox(
          height: 150,
          child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: data?.length ?? 0,
          itemBuilder: (BuildContext context, int index){
           return GestureDetector(
            onTap: (){
               Navigator.push(context,MaterialPageRoute(builder: (context)=>DoctorProfile(doc: data[index],) ));
            },
             child: Container(
              padding: EdgeInsets.all(12),
              margin: const EdgeInsets.all(8),
              color: Color.fromARGB(255, 210, 89, 89),
              child:  Column(children: [
                Icon(iconList[index],size: 70,),
                Text(data![index]['docName']),
                Text(data[index]['docCategory']),
              ],),
             ),
           );
          },
        )
        );

}

}),



GestureDetector(
  onTap: () {},
  child: Align(alignment: Alignment.centerRight,child: Text("view all"),))

        ],
      ),
    );
  }
}