import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:adabank/controller/session_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key, required SessionController sessionController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
          child: SvgPicture.asset(
        "assets/svg/Logo.svg",
        height: 100,
        width: 100,
      )),
    );
  }
}
