import 'package:flutter/material.dart';

import 'package:after_layout/after_layout.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:loginfirebase/libs/auth.dart';




class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with AfterLayoutMixin {

  @override
  void afterFirstLayout(BuildContext context) {
    
    Auth.instance.user.then((FirebaseUser user) {
      
      if (user != null) {
        Navigator.pushReplacementNamed(context, '/homepage');
      } else {
        Navigator.pushReplacementNamed(context, '/loginpage');
      }

    }); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}