import 'dart:developer';

import 'package:adabank/controller/session_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  int value = -1.obs;
  RxString countryCode = "+91".obs;
  TextEditingController phoneNumberFieldController = TextEditingController();
  RxBool hasError = false.obs;
  final formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String smsCode = "";
  String phoneNumber = "";
  String verificationId = "";

  RxList<String> countryCodeList = [
    "+91",
    "+90",
    "+92",
    "+93",
    "+94",
    "+95",
  ].obs;

  RxList<DropdownMenuItem<dynamic>> countryCodeDropdownMenu = [
    const DropdownMenuItem(
      value: -1,
      alignment: AlignmentDirectional.center,
      child: Text("+91"),
    ),
    const DropdownMenuItem(
      value: 1,
      alignment: AlignmentDirectional.center,
      child: Text("+90"),
    ),
    const DropdownMenuItem(
      value: 2,
      alignment: AlignmentDirectional.center,
      child: Text("+92"),
    ),
    const DropdownMenuItem(
      value: 3,
      alignment: AlignmentDirectional.center,
      child: Text("+93"),
    ),
    const DropdownMenuItem(
      value: 4,
      alignment: AlignmentDirectional.center,
      child: Text("+94"),
    ),
    const DropdownMenuItem(
      value: 5,
      alignment: AlignmentDirectional.center,
      child: Text("+95"),
    ),
  ].obs;

  void phoneNumberFieldListener(String digit) {
    if (digit.startsWith("b") && phoneNumberFieldController.text.isNotEmpty) {
      phoneNumberFieldController.text = phoneNumberFieldController.text
          .substring(0, phoneNumberFieldController.text.length - 1);
    } else if (phoneNumberFieldController.text.length < 10 &&
        !digit.startsWith("b")) {
      phoneNumberFieldController.text += digit;
    } else {}
  }

  // phone verification
  Future<bool> verifyPhoneNumber(String phoneNumber) async {
    if (phoneNumber.length == 13) {
      try {
        await _auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await _auth.signInWithCredential(credential);
            Get.snackbar(
              "Verification Successful",
              "Phone number automatically verified and user signed in.",
              backgroundColor: const Color.fromARGB(155, 16, 96, 72),
              duration: const Duration(milliseconds: 1500),
              icon: const Icon(
                Icons.check_circle_outline_rounded,
                color: Colors.black,
                size: 35,
              ),
            );
          },
          verificationFailed: (FirebaseAuthException e) {
            Get.snackbar(
              "Verification failed!",
              "${e.message}",
              backgroundColor: const Color.fromARGB(155, 16, 96, 72),
              duration: const Duration(milliseconds: 1500),
              icon: const Icon(
                Icons.warning_amber_rounded,
                color: Colors.black,
                size: 35,
              ),
            );
          },
          codeSent: (String verificationId, int? resendToken) {
            this.verificationId = verificationId;
            this.phoneNumber = phoneNumber;
            Get.snackbar(
              "Verification code sent",
              "Enter your verification code onto below field.",
              backgroundColor: const Color.fromARGB(155, 16, 96, 72),
              duration: const Duration(milliseconds: 1500),
              icon: const Icon(
                Icons.check_circle_outline_rounded,
                color: Colors.black,
                size: 35,
              ),
            );
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            this.verificationId = verificationId;
          },
        );

        return true;
      } catch (exception) {
        log(exception.toString());
        return false;
      }
    } else {
      return false;
    }
  }

  // otp verification
  Future<bool> signInWithOtp() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    try {
      await _auth.signInWithCredential(credential);
      Get.snackbar(
        "Verification Successful",
        "Phone number verified successfully & User Registered.",
        backgroundColor: const Color.fromARGB(155, 16, 96, 72),
        duration: const Duration(milliseconds: 1500),
        icon: const Icon(
          Icons.check_circle_outline_rounded,
          color: Colors.black,
          size: 35,
        ),
      );

      SessionController.storePhoneToken(
        loginStatus: true,
        phoneNumber: phoneNumber,
      );

      return true;
    } catch (exception) {
      log(exception.toString());
      return false;
    }
  }
}
