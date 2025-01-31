import 'package:adabank/view/fingerprint_scan_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:adabank/bindings/bindings.dart';
import 'package:adabank/theme/shared_style.dart';
import 'package:adabank/controller/navigation_controller.dart';
import 'package:adabank/view/ui_components/shared_widgets.dart';

class SetPinScreen extends StatelessWidget {
  const SetPinScreen({super.key});

  Container pinFieldContainer(int index) {
    return Container(
      width: 60,
      height: 60,
      padding: const EdgeInsets.only(bottom: 5, top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromARGB(180, 9, 112, 62),
      ),
      child: Center(
        child: Text(
          setPinController.pinMap[index] != ""
              ? "*"
              : setPinController.pinMap[index]!,
          style: const TextStyle(fontSize: 28, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            setPinController.clearPin();
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
        children: [
          const Spacer(flex: 2),
          Text(
            "Set your PIN",
            style: textStyle(
              34,
              FontWeight.w600,
              Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "You will get use this to login next time",
            style: textStyle(
              14,
              FontWeight.w400,
              Colors.black54,
            ),
          ),
          const Spacer(flex: 2),
          Container(
            width: width,
            height: 60,
            margin: const EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 30,
            ),
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  pinFieldContainer(0),
                  pinFieldContainer(1),
                  pinFieldContainer(2),
                  pinFieldContainer(3),
                ],
              ),
            ),
          ),
          const Spacer(flex: 3),
          numPadWidget(
            context,
            setPinController.setPinListener,
          ),
          GestureDetector(
            onTap: () {
              deleteSetPinController();
              setPinController.isPinSet()
                  ? pushScreen(context, const FingerprintScanScreen())
                  : Get.snackbar(
                      "Warning! Enter Valid PIN",
                      "Be Wise, your pin is required for future sessions.",
                      backgroundColor: const Color.fromARGB(155, 16, 96, 72),
                      duration: const Duration(milliseconds: 1500),
                      icon: const Icon(
                        Icons.warning_amber_rounded,
                        color: Colors.black,
                        size: 35,
                      ),
                    );
            },
            child: customButtonWidget(
              context: context,
              color: Theme.of(context).primaryColor,
              title: "NEXT",
              margin: const EdgeInsets.symmetric(horizontal: 25),
            ),
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
