import 'package:flutter/material.dart';
import 'package:flutter_app/Screen/Welcome/Login/LoginScreen.dart';
import 'package:flutter_app/Routes.dart';
import 'package:flutter_app/Theme.dart';
import 'package:firebase_core/firebase_core.dart';

// void main() => runApp(MyApp());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SANJAYA Stationery',
      theme: theme(),
      initialRoute: LoginScreen.routeName,
      routes: route,
    );
  }
}
