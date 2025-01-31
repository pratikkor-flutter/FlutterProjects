import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:adabank/view/splash_screen.dart';
import 'package:adabank/theme/shared_style.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:adabank/controller/session_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const AdaBankApp());
}

class AdaBankApp extends StatelessWidget {
  const AdaBankApp({super.key});

  @override
  Widget build(BuildContext context) {
    setDeviceSize(
      deviceWidth: MediaQuery.sizeOf(context).width,
      deviceHeight: MediaQuery.sizeOf(context).height,
    );
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 16, 96, 72),
      ),
      home: SplashScreen(sessionController: Get.put(SessionController())),
      debugShowCheckedModeBanner: false,
    );
  }
}
