import 'package:flutter/material.dart';
import 'package:flutter_app/Components/Register/RegisterComponent.dart';
import 'package:flutter_app/SizeConfig.dart';

class RegisterScreen extends StatelessWidget {
  static String routeName = '/register';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: RegisterComponent(),
    );
  }
}
