import 'package:flutter/material.dart';
import 'package:notes/addNote.dart';
import 'package:notes/note.dart';

import 'firebase/auth.dart';
import 'home.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool val = false;
  String hPassword = "";
  TextEditingController _displayNameController = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  Color? thme = Colors.grey[300];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(title: Text("Login/Signup")),
            body: Container(
              color: Colors.black,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  TextField(
                    style: TextStyle(color: Colors.green),
                    controller: _email,
                    decoration: InputDecoration(
                      errorText: null,
                      hintText: "Email adress",
                      hintStyle: TextStyle(color: Colors.green),
                      fillColor: Colors.red,
                      focusColor: Colors.yellow,
                    ),
                  ),
                  TextField(
                    obscureText: true,
                    style: TextStyle(color: Colors.green),
                    controller: _password,
                    decoration: InputDecoration(
                        //errorText: hPassword,
                        hintStyle: TextStyle(color: Colors.green),
                        hintText: "Password"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () async {
                            Custom shouldNavigate =
                                await register(_email.text, _password.text);
                            if (shouldNavigate.pass == true) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()));
                            } else if (shouldNavigate.pass == false) {
                              setState(() {
                                hPassword = shouldNavigate.error!;
                              });
                            }
                          },
                          child: Text("Signup")),
                      ElevatedButton(
                          onPressed: () async {
                            Custom shouldNavigate =
                                await signIn(_email.text, _password.text);
                            if (shouldNavigate.pass == true) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NoteDisplay()));
                            } else if (shouldNavigate.pass == false) {
                              setState(() {
                                hPassword = shouldNavigate.error!;
                              });
                            }
                          },
                          child: Text("Login")),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    hPassword,
                    style: TextStyle(color: Colors.red, fontSize: 15),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

class __email {}
