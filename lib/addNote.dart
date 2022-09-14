// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:notes/firebase/auth.dart';
import 'package:notes/note.dart';

class AddNote extends StatelessWidget {
  TextEditingController NoteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Add note"),
        ),
        body: Container(
          color: Colors.black,
          child: Column(
            children: <Widget>[
              TextField(
                style: TextStyle(color: Colors.white),
                controller: NoteController,
                decoration: InputDecoration(
                    hintText: "Buy vegii's form market...",
                    hintStyle: TextStyle(color: Colors.grey)),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                child: Text("Add"),
                onPressed: () async {
                  await addUser(NoteController);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NoteDisplay()));
                },
              )
            ],
          ),
        ));
  }
}
