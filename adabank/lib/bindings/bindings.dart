import 'package:get/get.dart';
import 'package:adabank/controller/navbar_controller.dart';
import 'package:adabank/controller/login_controller.dart';
import 'package:adabank/controller/set_pin_controller.dart';
import 'package:adabank/controller/ripple_animation_controller.dart';

// login controller login_screen.dart
final LoginController loginController = Get.put(LoginController());

void deleteLoginController() {
  Get.delete<LoginController>();
}

// set pin controller for set_pin_screen.dart
final SetPinController setPinController = Get.put(SetPinController());

void deleteSetPinController() {
  Get.delete<SetPinController>();
}

// ripple animation controller for fingerprint_scan_screen.dart & nearby_boarding_screen.dart
final RippleAnimationController rippleAnimationController =
    Get.put(RippleAnimationController());

// nav bar controller nav_screen.dart
final NavbarController navbarController = Get.put(NavbarController());
