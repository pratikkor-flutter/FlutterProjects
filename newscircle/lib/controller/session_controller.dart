import 'dart:developer';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newscircle/api/api_manipulation.dart';
import 'package:newscircle/controller/database_controller.dart';

class SessionController extends GetxController {
  static bool userStatus = false;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(
      const Duration(seconds: 0),
      () {
        try {
          ApiManipulation.getTopHeadlines();
          DatabaseController().getRecentNews();
          getUserToken();
        } catch (exception) {
          log(exception.toString());
        }
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
    Future.delayed(
      const Duration(milliseconds: 3000),
      () {
        userStatus ? Get.offNamed('/home') : Get.offNamed('/onBoarding');
      },
    );
  }

  static void storeUserToken({required bool loginStatus}) async {
    GetStorage storageInstance = GetStorage();
    await storageInstance.write('userStatus', loginStatus);

    getUserToken();
  }

  static void getUserToken() {
    GetStorage storageInstance = GetStorage();
    userStatus = storageInstance.read('userStatus')!;
  }
}
