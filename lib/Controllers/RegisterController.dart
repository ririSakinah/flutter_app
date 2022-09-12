import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterController extends GetxController {
  late TextEditingController nameC, usernameC, passwordC;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void register(String name, String username, String password)  {
    CollectionReference adduser = firestore.collection('users');

    try {
       adduser
          .add({'name': name, 'username': username, 'password': password});

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

  @override
  void onInit() {
    nameC = TextEditingController();
    usernameC = TextEditingController();
    passwordC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameC.dispose();
    usernameC.dispose();
    passwordC.dispose();
    super.onClose();
  }
}
