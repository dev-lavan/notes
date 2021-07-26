import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:notes/addNote.dart';
import 'package:notes/login.dart';

class NoteDisplay extends StatefulWidget {
  @override
  _NoteDisplayState createState() => _NoteDisplayState();
}

class _NoteDisplayState extends State<NoteDisplay> {
  var firebaseDb = FirebaseFirestore.instance.collection('notes').snapshots();
  bool _throwShotAway = false;
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
          child: Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddNote()));
            }),
        appBar: AppBar(
          actions: [IconButton(onPressed: (){ FirebaseAuth.instance.signOut(); Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));} ,  icon: Icon(Icons.logout, color: Colors.red,))],
          title: Text("Notes")
          ),
        body: Container(
          color: Colors.black,
          child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance.collection('notes').orderBy("Data", descending: true).snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      bool tick = false;
                      TextDecoration? notechecked = null;

                      return StatefulBuilder(
                        builder: (BuildContext context,StateSetter setState) {
                          return CheckboxListTile(
                            //tileColor: Colors.white,
                            value: tick,
                            onChanged: (value) {
                              setState(() {
                                tick = value!;
                                if(!tick)
                                  notechecked = null;
                                else if(tick)
                                  notechecked = TextDecoration.lineThrough;
                              });
                            },
                            title: Text(
                              snapshot.data!.docs[index]['Data'],
                              style: TextStyle(
                                color:Colors.white,
                                decoration: notechecked
                              ),
                              ),
                          );
                        },
                      );
                    });
              }),
        ),
      ),
    );
  }
}
