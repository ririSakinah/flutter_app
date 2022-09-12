import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Screen/Home/HomeScreen.dart';
import 'package:flutter_app/Screen/Welcome/Login/LoginScreen.dart';
import 'package:flutter_app/Screen/Welcome/Register/Register_Screen.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final User? user = auth.currentUser;
final uid = user?.uid;

final Map<String, WidgetBuilder> route = {
  '/login': (context) => LoginScreen(),
  '/register': (context) => RegisterScreen(),
  '/home': (context) =>  HomeScreen(),
};
