import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:covid_tracker/services/routes.dart';
import 'package:covid_tracker/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool showSpinner = false;
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // ignore: unused_field
  bool _isSuccess;

  // ignore: unused_field
  String _userEmail;

  String fname;
  String lname;
  String email;
  String password;
  String phone;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          onChanged: (value) {
                            fname = value;
                          },
                          textAlign: TextAlign.center,
                          decoration: kTextFieldDecoration.copyWith(
                              hintText: 'First Name'),
                          validator: (value) =>
                              value.isEmpty ? 'First Name cant be empty' : null,
                        ),
                      ),
                      SizedBox(
                        width: 25.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          onChanged: (value) {
                            lname = value;
                          },
                          textAlign: TextAlign.center,
                          decoration: kTextFieldDecoration.copyWith(
                              hintText: 'Last Name'),
                          validator: (value) =>
                              value.isEmpty ? 'Last Name cant be empty' : null,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your email'),
                    validator: (value) =>
                        value.isEmpty ? 'Email cant be empty' : null,
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      phone = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your Number'),
                    validator: (value) =>
                        value.isEmpty ? 'Number cant be empty' : null,
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  TextFormField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your Password'),
                    validator: (value) =>
                        value.isEmpty ? 'Password cant be empty' : null,
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        elevation: 10,
                        color: Colors.redAccent,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              showSpinner = true;
                            });
                            try {
                              _firestore.collection('Users').add(
                                {
                                  'Email': email,
                                  'Fname': fname,
                                  'Lname': lname,
                                  'Phone': int.parse(phone)
                                },
                              );
                              final newUser =
                                  await _auth.createUserWithEmailAndPassword(
                                      email: email, password: password);
                              if (newUser != null) {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => Routing(),
                                  ),
                                );
                                setState(() {
                                  showSpinner = false;
                                });
                              } else {
                                setState(() {
                                  showSpinner = false;
                                });
                              }
                            } catch (e) {
                              print(e);
                            }
                          } else {
                            setState(() {
                              showSpinner = false;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
