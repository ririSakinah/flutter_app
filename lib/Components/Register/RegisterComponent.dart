import 'package:flutter/material.dart';
import 'package:flutter_app/Components/Login/LoginForm.dart';
import 'package:flutter_app/Components/Register/RegisterForm.dart';
import 'package:flutter_app/constants.dart';
import 'package:shadow/shadow.dart';

import '../../SizeConfig.dart';

class RegisterComponent extends StatefulWidget {
  @override
  _RegisterComponentState createState() => _RegisterComponentState();
}

class _RegisterComponentState extends State<RegisterComponent> {
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
                        'assets/images/telemedicine.png',
                        height: 150,
                        width: 150,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                    ),
                    SizedBox(height: 20),
                    RegisterForm()
                  ],
                ),
              ),
            )));
  }
}
