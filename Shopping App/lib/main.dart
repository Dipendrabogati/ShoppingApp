//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/boottm_navigtion.dart';
//import 'package:untitled6/home_screen.dart';
import 'package:untitled6/signup_screen.dart';

void main() async{
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp( const  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignupScreen())
  );

}


