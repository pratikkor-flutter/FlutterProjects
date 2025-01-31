import 'dart:developer';
import 'package:adabank/view/pin/pin_verification_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:adabank/view/onboarding_screen.dart';

class SessionController extends GetxController {
  static bool loginStatus = false;
  static String? phoneNumber;
  static String? pin;

  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 0), () {
      try {
        getLoginSession();
      } catch (exception) {
        log(exception.toString());
      }
    });
    Future.delayed(
      const Duration(seconds: 3),
      () {
        loginStatus
            ? Get.off(() => const PinVerificationScreen())
            : Get.off(() => const OnBoardingScreen());
      },
    );
  }

  static void storePhoneToken({
    required bool loginStatus,
    String? phoneNumber,
  }) {
    GetStorage storageInstance = GetStorage();
    storageInstance.write('loginStatus', loginStatus);
    storageInstance.write('phoneNumber', phoneNumber);

    getPhoneToken();
  }

  static void getPhoneToken() {
    GetStorage storageInstance = GetStorage();
    loginStatus = storageInstance.read('loginStatus')!;
    phoneNumber = storageInstance.read('phoneNumber')!;
  }

  static void storePinToken({
    required bool loginStatus,
    String? pin,
  }) {
    GetStorage storageInstance = GetStorage();
    storageInstance.write('loginStatus', loginStatus);
    storageInstance.write('pin', pin);

    getPinToken();
  }

  static void getPinToken() {
    GetStorage storageInstance = GetStorage();
    loginStatus = storageInstance.read('loginStatus')!;
    pin = storageInstance.read('pin')!;
  }

  static void getLoginSession() {
    GetStorage storageInstance = GetStorage();
    loginStatus = storageInstance.read('loginStatus')!;
    phoneNumber = storageInstance.read('phoneNumber')!;
    pin = storageInstance.read('pin')!;
  }
}
