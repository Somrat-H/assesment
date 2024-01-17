// ignore_for_file: unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../ui/screen/home/home_page.dart';
import '../ui/screen/home/widget/custom_alert.dart';
import '../ui/widget/custom_snakbar.dart';

class LoginProvider with ChangeNotifier {
  void logIn(emailController, passwordController, context) async {
    try {
      // ignore: unused_local_variable
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString(),
      );
      print("Credeintal $credential");
      if (credential != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const HomePage()));
      } 
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // print('No user found for that email.');
       
        errorShow("No user found for that email", context);
      } else if (e.code == 'wrong-password') {
        errorShow("Wrong password", context);
        // print('Wrong password provided for that user.');
      }
    } 
    notifyListeners();
  }
}
