import 'package:get/get.dart';
import 'package:newscircle/controller/session_controller.dart';

class SessionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SessionController());
  }
}
