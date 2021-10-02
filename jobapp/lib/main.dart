import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobapp/pages/details.dart';
import 'package:jobapp/pages/favorit.dart';
import 'package:jobapp/pages/firstpage.dart';
import 'package:jobapp/pages/login.dart';
import 'package:jobapp/pages/menu.dart';
import 'package:jobapp/pages/profile.dart';
import 'package:jobapp/pages/register.dart';
import 'package:jobapp/pages/started.dart';
import 'package:jobapp/pages/splash.dart';
import 'package:jobapp/pages/test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return MaterialApp(
      
     debugShowCheckedModeBanner: false,
     routes:{
       '/':(context)=>SplashPage(),
       '/first':(context)=>FirstPage(),
       '/home':(context)=>HomePage(),
       '/login':(context)=>LoginPage(),
       '/register':(context)=>RegisterPage(),
       '/menu':(context)=>Menu(),
       '/details':(context)=>Details(),
       '/profile':(context)=>Profile(),
       '/favorite':(context)=>SaveJob(),
       '/coba':(context)=>Coba()
       
     }
    );
  }
}