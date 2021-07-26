import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';                                    // new
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart'; 

class Custom{
  bool? pass;
  String? error;
}



 

Future<Custom> signIn(String email, String password) async {
  Custom object = Custom();
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
        object.pass = true;
    return object;
  } catch (e) {
    print(e);
    object.pass = false;
    object.error = e.toString();
    return object;
  }
}
Future<Custom> register(String email, String password) async {
  Custom object = Custom();

  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
        object.pass = true;
        object.error = null;
    return object;
  } on FirebaseAuthException catch (e) {
    object.pass = false;
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
      object.error = e.code;
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
      object.error = e.code;
    }
    return object;
  } catch (e) {
    print(e.toString());
    object.pass = false;
    return object;
  }
}

CollectionReference note = FirebaseFirestore.instance.collection('notes');

Future<void> addUser(TextEditingController data) {
      // Call the user's CollectionReference to add a new user
      return note
          .add({
            'Data': data.text, // John Doe
           
            
          })
          .then((value) => print("Note Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

