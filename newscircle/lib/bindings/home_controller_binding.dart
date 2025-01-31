import 'package:get/get.dart';
import 'package:newscircle/controller/home_controller.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
