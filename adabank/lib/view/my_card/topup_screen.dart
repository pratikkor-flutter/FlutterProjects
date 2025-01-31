import 'package:adabank/controller/card/card_controller.dart';
import 'package:adabank/firebase/firestore_data_manipulations.dart';
import 'package:adabank/theme/shared_style.dart';
import 'package:adabank/view/my_card/card_design.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopUpScreen extends StatelessWidget {
  const TopUpScreen({super.key});

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
          headingForMyCardScreen("Top Up"),
          Positioned(
            top: height * 0.3,
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Top Up",
                    style: textStyle(14, FontWeight.w500, Colors.black45),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black26),
                      ),
                      icon: const Text("\$"),
                      border: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black26, width: 0.5),
                      ),
                      hintText: " ${CardController.topupAmount.value}",
                      hintStyle: textStyle(16, FontWeight.w500, Colors.black87),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Saldo Active",
                        style: textStyle(14, FontWeight.w500, Colors.black45),
                      ),
                      Text(
                        "\$ ${userProfile.balance}",
                        style: textStyle(14, FontWeight.w500, Colors.black54),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                    child: Center(
                      child: LinearProgressIndicator(
                        value: 0.2,
                        minHeight: 24,
                        color: Colors.white,
                        backgroundColor: const Color.fromARGB(255, 16, 96, 72),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 165,
                    child: GridView.builder(
                      itemCount: 8,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 2,
                        childAspectRatio: 4.5,
                        crossAxisCount: 4,
                        mainAxisExtent: 45,
                      ),
                      itemBuilder: (context, index) {
                        return Obx(
                          () => GestureDetector(
                            onTap: () {
                              CardController.currentTopupAmount.value = index;
                            },
                            child: Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(1.5),
                              decoration: BoxDecoration(
                                color:
                                    (CardController.currentTopupAmount.value ==
                                            index)
                                        ? const Color.fromARGB(255, 16, 96, 72)
                                        : const Color.fromARGB(40, 0, 0, 0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                "${CardController.topupAmountList[index]}",
                                style: textStyle(
                                    12, FontWeight.w500, Colors.white),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: width,
                    child: Text(
                      "Money will be moved from\nactive balance to add card balance",
                      style: textStyle(14, FontWeight.w500, Colors.black45),
                      textAlign: TextAlign.center,
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
