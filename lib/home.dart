import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notes/addNote.dart';
import 'firebase/auth.dart';


class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool valuee = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
       onWillPop: () async => false,
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> AddNote()));
              },
              child: Text("+",
              style:TextStyle(fontSize: 30)
              ),
              ),
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text('Notes'),
          actions: [
              IconButton(
                onPressed: ()async {
                  FirebaseAuth.instance.signOut();
                  Navigator.pop(context);
                }, 
                icon: Icon(
                  Icons.logout_sharp,
                  color: Colors.red
                  )
                )
          ],
        ),
        body:  
        ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index){
            return Card(
              child: CheckboxListTile(
                value: valuee,
                onChanged: (index){
                  setState((){
                    valuee = !valuee;
                  });
                 
                } ,
                 title : Text('list tile'),
                ),
              );
              //color: Colors.grey[50],);
          }
          ),
        
      ),
    );
  }
}