import 'package:adabank/controller/navigation_controller.dart';
import 'package:adabank/controller/transfer/transfer_screen_controller.dart';
import 'package:adabank/theme/shared_style.dart';
import 'package:adabank/view/qr_scanner/qr_scanner_screen.dart';
import 'package:adabank/view/transfer/contact_bottom_sheet.dart';
import 'package:adabank/view/transfer/nearby/nearby_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  Widget borderedCircularContainer() {
    return Container(
      width: 35,
      height: 35,
      margin: const EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5,
          color: Colors.white,
        ),
        color: const Color.fromARGB(255, 16, 96, 72),
        shape: BoxShape.circle,
      ),
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(360),
        ),
      ),
    );
  }

  Widget cirularContainer() {
    return Container(
      width: 25,
      height: 25,
      margin: const EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(360),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: GestureDetector(
          onTap: () {
            TransferScreenController.transferMode[0] = true;
            TransferScreenController.transferMode[1] = false;
            TransferScreenController.transferMode[2] = false;
            popScreen(context);
          },
          child: Container(
            width: 15,
            height: 15,
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Icon(
              Icons.arrow_back_rounded,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        title: Text(
          "Transfer",
          style: textStyle(16, FontWeight.w500, Colors.white),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.sizeOf(context).width,
            height: 125,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    TransferScreenController.transferMode[0] = true;
                    TransferScreenController.transferMode[1] = false;
                    TransferScreenController.transferMode[2] = false;
                    Future.delayed(Durations.long1);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TransferScreenController.transferMode[0]
                          ? borderedCircularContainer()
                          : cirularContainer(),
                      Text(
                        "Bank account",
                        style: textStyle(12, FontWeight.w500, Colors.white),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    TransferScreenController.transferMode[0] = false;
                    TransferScreenController.transferMode[1] = true;
                    TransferScreenController.transferMode[2] = false;
                    Future.delayed(Durations.long1);
                    pushScreen(context, const QrScannerScreen());
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TransferScreenController.transferMode[1]
                          ? borderedCircularContainer()
                          : cirularContainer(),
                      Text(
                        "Scan",
                        style: textStyle(12, FontWeight.w500, Colors.white70),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    TransferScreenController.transferMode[0] = false;
                    TransferScreenController.transferMode[1] = false;
                    TransferScreenController.transferMode[2] = true;
                    Future.delayed(Durations.long1);
                    pushScreen(context, const NearByBoardingScreen());
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TransferScreenController.transferMode[2]
                          ? borderedCircularContainer()
                          : cirularContainer(),
                      Text(
                        "Nearby",
                        style: textStyle(12, FontWeight.w500, Colors.white70),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const ContactBottomSheet(),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: 65,
              color: Colors.white,
              padding: const EdgeInsets.only(left: 35),
              child: Row(
                children: [
                  GestureDetector(
                    child: SizedBox(
                      width: 45,
                      height: 45,
                      child: SvgPicture.asset("assets/svg/button_plus.svg"),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Add Contact",
                    style: textStyle(16, FontWeight.w400, Colors.black54),
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
