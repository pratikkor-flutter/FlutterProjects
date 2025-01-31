import 'package:adabank/controller/navigation_controller.dart';
import 'package:adabank/firebase/firestore_data_manipulations.dart';
import 'package:adabank/theme/shared_style.dart';
import 'package:adabank/view/qr_scanner/qr_scanner_screen.dart';
import 'package:adabank/view/ui_components/dashed_divider.dart';
import 'package:adabank/view/ui_components/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class QrGeneratorScreen extends StatelessWidget {
  const QrGeneratorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          Text(
            "My QR Code",
            style: textStyle(20, FontWeight.w500, Colors.black),
          ),
          const Spacer(flex: 1),
          Container(
            width: width,
            height: height / 1.75,
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 10,
                  color: Colors.black12,
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 20,
                  left: 30,
                  child: Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: const Color.fromARGB(205, 95, 163, 143),
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: FractionallySizedBox(
                        heightFactor: 1,
                        widthFactor: 1,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Image.asset("assets/images/profile.png"),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 25,
                  left: 115,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Profile Name",
                        style: textStyle(14, FontWeight.w400, Colors.black45),
                      ),
                      Text(
                        userProfile.name,
                        style: textStyle(24, FontWeight.w500, Colors.black),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 105,
                  child: DashedDivider(
                    length: width - 125,
                  ),
                ),
                Positioned(
                  top: 120,
                  child: Text(
                    "Scan This Code To Pay",
                    style: textStyle(12, FontWeight.w600, Colors.black87),
                    textAlign: TextAlign.center,
                  ),
                ),
                Positioned(
                  top: height * 0.2,
                  child: SizedBox(
                    width: width * 0.6,
                    child: PrettyQrView.data(
                      data: "${userProfile.name} | ${userProfile.bankNumber}",
                      decoration: const PrettyQrDecoration(
                        shape: PrettyQrSmoothSymbol(
                          color: Color.fromARGB(255, 9, 112, 62),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.52,
                  child: GestureDetector(
                    onTap: () => Get.snackbar(
                      "Service Unavailable!",
                      "Barcode Service is currently unavailable.",
                      backgroundColor: const Color.fromARGB(155, 16, 96, 72),
                      duration: const Duration(milliseconds: 1500),
                      icon: const Icon(
                        Icons.warning_amber_rounded,
                        color: Colors.black,
                        size: 35,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.swap_horiz_rounded),
                        const SizedBox(width: 15),
                        Text(
                          "Change To Barcode",
                          style: textStyle(14, FontWeight.w400, Colors.black87),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(flex: 1),
          GestureDetector(
            onTap: () {
              pushScreen(context, const QrScannerScreen());
            },
            child: customButtonWidget(
              context: context,
              color: Theme.of(context).primaryColor,
              title: "SCAN CODE QR",
              margin: const EdgeInsets.symmetric(horizontal: 25),
            ),
          ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}
