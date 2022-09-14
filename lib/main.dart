import 'package:flutter/material.dart';
import 'package:notes/home.dart';
import 'package:notes/login.dart';
import "package:firebase_core/firebase_core.dart";
import 'dart:async';                                   
import 'package:cloud_firestore/cloud_firestore.dart'; 


// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
 

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: "/",
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.green,
      
      ),
      //home: Login(),
      routes: {
    
    '/': (context) => Login(),
    
    // When navigating to the "/second" route, build the SecondScreen widget.
    //'/second': (context) => SecondScreen(),
  },
    );
  }
}


