import 'package:adabank/view/transfer/receipt_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:adabank/theme/shared_style.dart';
import 'package:page_transition/page_transition.dart';
import 'package:adabank/controller/navigation_controller.dart';
import 'package:adabank/view/ui_components/shared_widgets.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:adabank/controller/home/home_screen_controller.dart';
import 'package:adabank/controller/transfer/transfer_screen_controller.dart';

class TransferDetailScreen extends StatelessWidget {
  final Map<String, String> transferContactDetail;
  const TransferDetailScreen({super.key, required this.transferContactDetail});

  void _amountListener(String digit) {
    if (digit.startsWith("b") &&
        digit.length > 1 &&
        TransferScreenController.transferAmount.value.isNotEmpty) {
      TransferScreenController.transferAmount.value =
          TransferScreenController.transferAmount.value.substring(
              0, TransferScreenController.transferAmount.value.length - 1);
    } else if (TransferScreenController.transferAmount.value.length < 5 &&
        !digit.startsWith("b")) {
      TransferScreenController.transferAmount.value += digit;
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: GestureDetector(
          onTap: () {
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
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 18,
            left: 25,
            child: Container(
              width: width - 50,
              height: height * 0.355,
              decoration: BoxDecoration(
                color: const Color.fromARGB(35, 246, 246, 246),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  width: 2,
                  color: const Color.fromARGB(160, 110, 168, 151),
                ),
              ),
              child: Stack(
                children: [
                  Center(
                    heightFactor: 3,
                    child: Text(
                      "Enter Amount",
                      style: textStyle(14, FontWeight.w400, Colors.white70),
                    ),
                  ),
                  Center(
                    heightFactor: 2.5,
                    child: Obx(
                      () => Text(
                        "\$${TransferScreenController.transferAmount}",
                        style: textStyle(44, FontWeight.w600, Colors.white),
                      ),
                    ),
                  ),
                  Center(
                    heightFactor: 12,
                    child: Container(
                      height: 22.5,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white30,
                      ),
                      child: Center(
                        child: Obx(
                          () => DropdownButton(
                            style: const TextStyle(
                                fontSize: 12, color: Colors.white),
                            dropdownColor: Colors.black45,
                            underline: const SizedBox(),
                            alignment: Alignment.center,
                            icon: const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Colors.white,
                            ),
                            value: HomeScreenController.value.value,
                            items: HomeScreenController.currencyCode,
                            onChanged: (value) {
                              HomeScreenController.value.value = value;
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: height * 0.19,
                    left: 25,
                    right: 25,
                    child: Divider(
                      color: Color.fromARGB(79, 255, 255, 255),
                      thickness: 0.5,
                    ),
                  ),
                  Positioned(
                    top: height * 0.23,
                    left: 25,
                    right: 25,
                    child: Container(
                      width: width - 50,
                      height: 76,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(35, 246, 246, 246),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          width: 2,
                          color: const Color.fromARGB(160, 110, 168, 151),
                        ),
                      ),
                      child: ListTile(
                        leading: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                image: AssetImage(
                                  transferContactDetail['profilePic']!,
                                ),
                                fit: BoxFit.fill),
                          ),
                        ),
                        title: Text(
                          transferContactDetail['name']!,
                          style: textStyle(
                            18,
                            FontWeight.w500,
                            Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          "Bank - ${transferContactDetail['bankNumber']!}",
                          style: textStyle(
                            12,
                            FontWeight.w400,
                            Colors.white60,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 75,
            left: 0,
            child: Container(
              width: width,
              padding: const EdgeInsets.symmetric(vertical: 12.5),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(34),
                  topRight: Radius.circular(34),
                ),
              ),
              child: numPadWidget(context, _amountListener),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: width,
              height: 75,
              color: Colors.white,
              padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
              child: Center(
                child: Obx(
                  () => SwipeableButtonView(
                    buttonText: 'SWIPE TO PAYMENT',
                    buttontextstyle:
                        textStyle(18, FontWeight.w500, Colors.white),
                    buttonWidget: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 25,
                      color: Theme.of(context).primaryColor,
                    ),
                    activeColor: Theme.of(context).primaryColor,
                    isFinished: TransferScreenController.isFinished.value,
                    onWaitingProcess: () {
                      Future.delayed(const Duration(seconds: 2), () {
                        TransferScreenController.isFinished.value = true;
                      });
                    },
                    onFinish: () async {
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          curve: Curves.bounceOut,
                          child: ReceiptScreen(
                            transferContactDetail: transferContactDetail,
                          ),
                        ),
                      );
                      TransferScreenController.isFinished.value = false;
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
