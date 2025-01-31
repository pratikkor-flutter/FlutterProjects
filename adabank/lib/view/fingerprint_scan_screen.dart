import 'package:flutter/material.dart';
import 'package:adabank/view/nav_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:adabank/bindings/bindings.dart';
import 'package:adabank/theme/shared_style.dart';
import 'package:adabank/controller/navigation_controller.dart';
import 'package:adabank/view/ui_components/shared_widgets.dart';

class FingerprintScanScreen extends StatelessWidget {
  const FingerprintScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            popScreen(context);
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
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          SizedBox(
            width: width,
            height: 325,
            child: Stack(
              alignment: Alignment.center,
              children: [
                rippleAnimationController.borderContainerForRippleAnimation(
                    75, const Color.fromRGBO(76, 175, 80, 1)),
                rippleAnimationController.borderContainerForRippleAnimation(
                    150, const Color.fromRGBO(76, 175, 80, 0.8)),
                rippleAnimationController.borderContainerForRippleAnimation(
                    225, const Color.fromRGBO(76, 175, 80, 0.6)),
                rippleAnimationController.borderContainerForRippleAnimation(
                    300, const Color.fromRGBO(76, 175, 80, 0.4)),
                Container(
                  width: 75,
                  height: 75,
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 9, 112, 62),
                  ),
                  child: SvgPicture.asset(
                    "assets/svg/fingerprint.svg",
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(flex: 3),
          Text(
            "Use Touch ID To\nAuthorise Payments",
            style: textStyle(
              28,
              FontWeight.w600,
              Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45.0),
            child: Text(
              "Active touch ID so you don’t need to confirm your PIN every time you want to send money",
              style: textStyle(
                13,
                FontWeight.w400,
                Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(flex: 2),
          GestureDetector(
            onTap: () {
              pushScreen(context, const NavScreen());
            },
            child: customButtonWidget(
              context: context,
              color: Theme.of(context).primaryColor,
              title: "FINISH",
              margin: const EdgeInsets.symmetric(horizontal: 25),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              pushScreen(context, const NavScreen());
            },
            child: customButtonWidget(
              context: context,
              color: const Color.fromARGB(175, 16, 96, 72),
              title: "SKIP",
              margin: const EdgeInsets.symmetric(horizontal: 25),
            ),
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
