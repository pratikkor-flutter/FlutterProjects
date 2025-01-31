import 'package:adabank/controller/card/card_controller.dart';
import 'package:adabank/theme/shared_style.dart';
import 'package:adabank/view/my_card/card_design.dart';
import 'package:adabank/view/ui_components/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePinScreen extends StatelessWidget {
  const ChangePinScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 16, 96, 72),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: -125,
            top: -125,
            child: Container(
              width: 350,
              height: 350,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                // color: Color.fromARGB(17, 255, 255, 255),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.transparent,
                    Color.fromARGB(55, 255, 255, 255)
                  ],
                ),
              ),
            ),
          ),
          headingForMyCardScreen("Change PIN"),
          Positioned(
            top: height * 0.3,
            bottom: 0,
            child: Container(
              width: width,
              height: height * 0.7,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 245, 245, 245),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(34),
                  topRight: Radius.circular(34),
                ),
              ),
            ),
          ),
          cardAsStaticWidget(),
          Positioned(
            left: 0,
            right: 0,
            top: height * 0.45,
            bottom: 0,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "New PIN",
                          style: textStyle(14, FontWeight.w500, Colors.black45),
                        ),
                        Obx(
                          () => CardController.showNewPIN.value
                              ? GestureDetector(
                                  onTap: () {
                                    CardController.showNewPIN.value = false;
                                  },
                                  child: const Icon(
                                    Icons.visibility_off_outlined,
                                    color: Colors.black54,
                                    size: 18.5,
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    CardController.showNewPIN.value = true;
                                  },
                                  child: const Icon(
                                    Icons.visibility_outlined,
                                    color: Colors.black54,
                                    size: 18.5,
                                  ),
                                ),
                        ),
                      ],
                    ),
                    Obx(
                      () => TextFormField(
                        obscureText: CardController.showNewPIN.value,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Comfirm PIN",
                          style: textStyle(14, FontWeight.w500, Colors.black45),
                        ),
                        Obx(
                          () => CardController.showComfirmPIN.value
                              ? GestureDetector(
                                  onTap: () {
                                    CardController.showComfirmPIN.value = false;
                                  },
                                  child: const Icon(
                                    Icons.visibility_off_outlined,
                                    color: Colors.black54,
                                    size: 18.5,
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    CardController.showComfirmPIN.value = true;
                                  },
                                  child: const Icon(
                                    Icons.visibility_outlined,
                                    color: Colors.black54,
                                    size: 18.5,
                                  ),
                                ),
                        ),
                      ],
                    ),
                    Obx(
                      () => TextFormField(
                        obscureText: CardController.showComfirmPIN.value,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: height - 80,
              child: customButtonWidget(
                  context: context,
                  color: Theme.of(context).primaryColor,
                  title: "SAVE",
                  margin: const EdgeInsets.symmetric(horizontal: 25))

              //  Container(
              //   width: width - 30,
              //   height: 65,
              //   margin: const EdgeInsets.only(bottom: 25),
              //   decoration: BoxDecoration(
              //     color: const Color.fromARGB(255, 9, 112, 62),
              //     borderRadius: BorderRadius.circular(50),
              //   ),
              //   child: Center(
              //     child: Text(
              //       "SAVE",
              //       style: textStyle(16, FontWeight.w500, Colors.white),
              //     ),
              //   ),
              // ),
              ),
        ],
      ),
    );
  }
}
