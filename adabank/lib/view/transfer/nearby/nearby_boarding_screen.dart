import 'package:adabank/bindings/bindings.dart';
import 'package:adabank/theme/shared_style.dart';
import 'package:adabank/view/ui_components/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NearByBoardingScreen extends StatelessWidget {
  const NearByBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 245, 245, 245),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 15,
            height: 15,
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.black87, borderRadius: BorderRadius.circular(12)),
            child: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Pay Nearby",
          style: textStyle(16, FontWeight.w500, Colors.black),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: width,
            height: height * 0.5,
            child: Stack(
              alignment: Alignment.center,
              children: [
                rippleAnimationController.containerForRipleAnimation(100),
                rippleAnimationController.containerForRipleAnimation(200),
                rippleAnimationController.containerForRipleAnimation(300),
                rippleAnimationController.containerForRipleAnimation(400),
                Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
                SvgPicture.asset(
                  "assets/svg/send.svg",
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width - 100,
            child: Text(
              "Searching For People Nearby..",
              style: textStyle(22, FontWeight.w600, Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width - 150,
            child: Text(
              "To find your friends, ask them to open the screen in their app, or  invite them to join",
              style: textStyle(14, FontWeight.w400, Colors.black54),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 65,
          ),
          GestureDetector(
            onTap: () {
              // pushScreen(context, const HelpScreen());
            },
            child: customButtonWidget(
              context: context,
              color: const Color.fromARGB(175, 16, 96, 72),
              title: "NEED HELP?",
              margin: const EdgeInsets.symmetric(horizontal: 75),
            ),
          ),
        ],
      ),
    );
  }
}
