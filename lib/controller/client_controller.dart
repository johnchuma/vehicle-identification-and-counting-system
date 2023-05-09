// ignore_for_file: avoid_print

import 'package:cardscanner/utils/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ClientController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  Rx<User?> userReceiver = Rx<User?>(null);
  User? get user => userReceiver.value;

  @override
  void onInit() {
    userReceiver.bindStream(auth.userChanges());
    super.onInit();
  }

  void login(String email, String password) async {
    try {
      launchLoader();
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Fluttertoast.showToast(
        msg: "Login successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green.withOpacity(0.6),
      );
      Get.back();
    } catch (e) {
      Get.back();
      Fluttertoast.showToast(
        msg: "Wrong credentials, failed to login",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red.withOpacity(0.6),
      );
      print(e);
    }
  }

  void logout() async {
    try {
      launchLoader();
      await auth.signOut();
      Get.back();
    } catch (e) {
      Get.back();
      print(e);
    }
  }
}
