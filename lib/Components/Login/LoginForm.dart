import 'package:flutter/material.dart';
import 'package:flutter_app/Components/google_sign_in_button.dart';
import 'package:flutter_app/Controllers/Authentication.dart';
import 'package:flutter_app/Screen/Home/HomeScreen.dart';
import 'package:flutter_app/Screen/Welcome/Register/Register_Screen.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/Routes.dart';
import '../../SizeConfig.dart';
import '../CustomSurfixIcon.dart';
import '../DefaultButtonCostumeColor.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  FocusNode focusNode = new FocusNode();
  final _formKey = GlobalKey<FormState>();
  String? username, password;
  bool? remember = false;

  TextEditingController txtusername = TextEditingController(),
      txtpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          buildusername(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildpassword(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text('Remember me'),
              Spacer(),
              GestureDetector(
                onTap: () {
                  print('Forgot Password');
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
          DefaultButtonCustomeColor(
            text: 'Sign In',
            color: kPrimaryColor,
            press: () {
              print('Sign In');
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/register');
            },
            child: Text(
              'Don\'t have an account? Sign Up',
              style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            FutureBuilder(
              future: Authentication.initializeFirebase(context: context),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error initializing Firebase');
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return GoogleSignInButton();
                }
                return CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    kPrimaryColor,
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: OutlinedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage("assets/images/facebook.png"),
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
                onPressed: () {
                  print('Sign In');
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: OutlinedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage("assets/images/twitter.png"),
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
                onPressed: () {
                  print('Sign In');
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
              ),
            ),
          ])
        ],
      ),
    );
  }

  TextFormField buildusername() {
    return TextFormField(
      controller: txtusername,
      keyboardType: TextInputType.emailAddress,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: 'Username',
        labelStyle: TextStyle(
          color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: 'assets/icons/User.svg',
        ),
        hintText: 'Enter your username',
        hintStyle: TextStyle(color: kHintTextColor),
      ),
    );
  }

  TextFormField buildpassword() {
    return TextFormField(
      controller: txtpassword,
      obscureText: true,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(
          color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: 'assets/icons/Lock.svg',
        ),
        hintText: 'Enter your password',
        hintStyle: TextStyle(color: kHintTextColor),
      ),
    );
  }
}
