import 'package:get/get.dart';

class CardController extends GetxController {
  static RxBool light = true.obs;
  static RxBool showNewPIN = false.obs;
  static RxBool showComfirmPIN = true.obs;
  static RxDouble topupAmount = 0.0.obs;
  static RxInt currentTopupAmount = 0.obs;
  static List<double> topupAmountList = [
    50.000,
    75.000,
    100.000,
    150.000,
    200.000,
    250.000,
    300.000,
    350.00,
  ].obs;
}
