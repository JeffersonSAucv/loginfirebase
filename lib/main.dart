import 'package:flutter/material.dart';
import 'package:loginfirebase/routes/routes.dart';
//import 'package:loginfirebase/splash/splash_page.dart';
import 'libs/Provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'SOCIAL AUTETICATION',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/splash',
        routes: getRoutes(),
      ),
    );
  }
}

