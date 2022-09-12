import 'package:flutter/material.dart';
import 'package:flutter_app/Components/Login/LoginComponent.dart';
import 'package:flutter_app/SizeConfig.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: LoginComponent()
    );
  }
}