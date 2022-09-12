import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Controllers/RegisterController.dart';
import 'package:flutter_app/Screen/Welcome/Register/Register_Screen.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/Routes.dart';
import 'package:get/get.dart';

import '../../SizeConfig.dart';
import '../CustomSurfixIcon.dart';
import '../DefaultButtonCostumeColor.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  FocusNode focusNode = new FocusNode();
  final _formKey = GlobalKey<FormState>();
  String? username, password;
  bool? remember = false;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  TextEditingController txtusername = TextEditingController(),
      txtpassword = TextEditingController(),
      txtname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          buildname(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildusername(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildpassword(),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButtonCustomeColor(
            text: 'Sign Up',
            color: kPrimaryColor,
            press: () {
              debugPrint(txtusername.text);
              register(txtname.text, txtusername.text, txtpassword.text);
            },
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButtonCustomeColor(
            text: 'Cancel',
            color: kPrimaryLightColor,
            press: () {
              print('Cancel');
              Navigator.pop(context);
            },
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
        ],
      ),
    );
  }

  TextFormField buildname() {
    return TextFormField(
      controller: txtname,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: 'Name',
        labelStyle: TextStyle(
          color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: 'assets/icons/User.svg',
        ),
        hintText: 'Enter your name',
        hintStyle: TextStyle(color: kHintTextColor),
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

  void register(String name, String username, String password) async {
    CollectionReference adduser = firestore.collection('users');
    try {
      adduser.add({'name': name, 'username': username, 'password': password});
      Get.defaultDialog(
        title: 'Success',
        middleText: 'Register Success',
        onConfirm: () => Get.back(),
        textConfirm: 'OK',
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: 'Error',
        middleText: 'Something went wrong',
      );
    }
  }
}
