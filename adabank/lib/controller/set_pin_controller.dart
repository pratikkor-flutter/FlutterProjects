import 'package:adabank/controller/session_controller.dart';
import 'package:get/get.dart';

class SetPinController extends GetxController {
  String pin = "";
  RxInt digitCounter = 0.obs;
  RxMap<int, String> pinMap = {0: "", 1: "", 2: "", 3: ""}.obs;

  void clearPin() {
    pinMap = {0: "", 1: "", 2: "", 3: ""}.obs;
    digitCounter = 0.obs;
  }

  void setPinListener(String digit) {
    if (digit.startsWith("b") && digitCounter.value >= 0) {
      pinMap[--digitCounter.value] = "";
    } else if (digitCounter.value <= 3) {
      pinMap[digitCounter.value++] = digit;
    }
  }

  bool isPinSet() {
    if (digitCounter.value == 4) {
      for (int i = 0; i < 4; i++) {
        pin = "$pin${pinMap[i]}";
      }
      SessionController.storePinToken(
        loginStatus: true,
        pin: pin,
      );
      SessionController.getLoginSession();
      return true;
    } else {
      return false;
    }
  }

  bool isPinMatch() {
    if (digitCounter.value == 4) {
      for (int i = 0; i < 4; i++) {
        pin = "$pin${pinMap[i]}";
      }
      if (SessionController.pin == pin) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
