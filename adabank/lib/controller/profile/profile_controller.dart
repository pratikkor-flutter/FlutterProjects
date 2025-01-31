import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static RxBool onlinePaymentLight = true.obs;
  static RxBool atmWithdrawalLight = true.obs;
  static RxBool paymentAbroadLight = false.obs;

  static RxBool isEdit = true.obs;
  static ScrollController scrollController = ScrollController();

  static RxBool turfOffCardLight = true.obs;
  static RxBool darkThemeLight = false.obs;
  static List<List<String>> settingItems = const [
    ["assets/svg/changePin.svg", "Change PIN"],
    ["assets/svg/changePassword.svg", "Change Password"],
    ["assets/svg/changeFingerprint.svg", "Change Fingerprint"],
    ["assets/svg/turnOffCard.svg", "Turn Off Card"],
  ];
}
