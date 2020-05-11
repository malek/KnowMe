import 'package:flutter/material.dart';
import 'package:tuto/pages/form_screen.dart';
import 'package:tuto/pages/home.dart';
import 'package:tuto/pages/printPage.dart';




void main() => runApp(
  MaterialApp(
  debugShowCheckedModeBanner: false,
  //initialRoute: '/home',

  routes:  {
    //'/': (context) => FormScreen(),
    '/':  (context) => Home(),
    '/form_screen':  (context) => FormScreen(),
    '/printPage':  (context) => PrintPage(),
    '/home':  (context) => Home(),
    
  } ,
));
