import 'package:flutter/material.dart';
import 'package:flutter_app/Components/Login/LoginForm.dart';
import 'package:flutter_app/constants.dart';
import 'package:shadow/shadow.dart';

import '../../SizeConfig.dart';

class LoginComponent extends StatefulWidget {
  @override
  _LoginComponentState createState() => _LoginComponentState();
}

class _LoginComponentState extends State<LoginComponent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: SizeConfig.screenHeight * 0.04),
                    SizedBox(height: SizeConfig.screenHeight * 0.04),
                    Shadow(
                      child: Image.asset(
                        'assets/images/doctor.png',
                        height: 150,
                        width: 150,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                    ),
                    SizedBox(height: 20),
                    SignInForm()
                    
                  ],
                ),
              ),
            )));
  }
}
