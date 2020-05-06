import 'package:flutter/material.dart';
import 'package:loginfirebase/screen/homepage.dart';
import 'package:loginfirebase/screen/loginDetail.dart';
import 'package:loginfirebase/screen/loginpage.dart';
import 'package:loginfirebase/splash/splash_page.dart';

Map<String, WidgetBuilder> getRoutes(){

    return <String, WidgetBuilder>{

        '/loginpage'   : (BuildContext context) => LoginPage(),
        '/homepage'    : (BuildContext context) => HomePage(),
        '/splash'      : (BuildContext context) => SplashPage(),
        '/logindetail' : (BuildContext context) => LoginDetail()


    };


}