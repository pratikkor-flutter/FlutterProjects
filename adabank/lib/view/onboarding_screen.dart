import 'package:flutter/material.dart';
import 'package:adabank/view/login_screen.dart';
import 'package:adabank/theme/shared_style.dart';
import 'package:adabank/controller/navigation_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          Positioned(
            left: -25,
            top: height * -0.02,
            child: Container(
              width: width,
              height: height * 0.75,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.transparent,
                    Color.fromARGB(94, 255, 255, 255),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: -100,
            top: height * -0.15,
            child: Container(
              width: width,
              height: height * 0.75,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(0, 255, 255, 255),
                    Color.fromARGB(49, 255, 255, 255),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: height * 0.1,
            child: Container(
              width: width,
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/splashScreenImg.png",
                height: height * 0.5,
              ),
            ),
          ),
          Positioned(
            left: width * 0.03,
            bottom: 16,
            child: Container(
              width: width - width * 0.06,
              padding: const EdgeInsets.fromLTRB(36, 35, 36, 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  width: 3,
                  color: const Color.fromARGB(255, 140, 204, 185),
                  style: BorderStyle.solid,
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Text(
                    "Start Payments Easily In The Digital Age",
                    style: textStyle(
                      24,
                      FontWeight.w600,
                      Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 15.0, 8.0, 35.0),
                    child: Text(
                      "Payment tool that is easy and fast to use in this easy-to-use digital era. Use the features that make your business easier",
                      style: textStyle(
                        14,
                        FontWeight.w400,
                        Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      popScreen(context);
                      pushScreen(context, const LoginScreen());
                    },
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(360),
                      ),
                      child: const Icon(
                        Icons.arrow_forward_rounded,
                        size: 33,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
