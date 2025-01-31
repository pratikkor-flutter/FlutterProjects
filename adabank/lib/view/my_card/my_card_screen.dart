import 'package:adabank/controller/card/card_controller.dart';
import 'package:adabank/view/my_card/card_design.dart';
import 'package:adabank/view/my_card/change_pin_screen.dart';
import 'package:adabank/view/my_card/topup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:adabank/theme/shared_style.dart';
import 'package:adabank/controller/navigation_controller.dart';
import 'package:get/get.dart';

class MyCardScreen extends StatelessWidget {
  const MyCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
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
          headingForMyCardScreen("My Card"),
          Positioned(
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
            bottom: 100,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 105,
                          height: 100,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 0.1,
                                blurRadius: 20,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                width: 50,
                                height: 60,
                                child:
                                    SvgPicture.asset("assets/svg/lockCard.svg"),
                              ),
                              Text(
                                "Lock Card",
                                style: textStyle(
                                    12, FontWeight.w500, Colors.black),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            pushScreen(context, const ChangePinScreen());
                          },
                          child: Container(
                            width: 105,
                            height: 100,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black12,
                                      spreadRadius: 0.1,
                                      blurRadius: 20),
                                ]),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 50,
                                  height: 60,
                                  child: SvgPicture.asset(
                                      "assets/svg/changePin.svg"),
                                ),
                                Text(
                                  "Change PIN",
                                  style: textStyle(
                                      12, FontWeight.w500, Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            pushScreen(context, const TopUpScreen());
                          },
                          child: Container(
                            width: 105,
                            height: 100,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black12,
                                      spreadRadius: 0.1,
                                      blurRadius: 20),
                                ]),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 50,
                                  height: 60,
                                  child:
                                      SvgPicture.asset("assets/svg/topup.svg"),
                                ),
                                Text(
                                  "Top UP",
                                  style: textStyle(
                                      12, FontWeight.w500, Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 28, left: 8, bottom: 5),
                      child: Text(
                        "Settings",
                        style: textStyle(14, FontWeight.w500, Colors.black45),
                      ),
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.all(8),
                      title: Text(
                        "Set Card Limit",
                        style: textStyle(14, FontWeight.w500, Colors.black),
                      ),
                      subtitle: Text(
                        "You set budget for 3 categories",
                        style: textStyle(12, FontWeight.w400, Colors.black54),
                      ),
                      trailing: Obx(
                        () => Switch(
                          value: CardController.light.value,
                          activeTrackColor: Theme.of(context).primaryColor,
                          onChanged: (bool value) {
                            CardController.light.value = value;
                          },
                        ),
                      ),
                    ),
                    const Divider(
                      height: 1,
                      indent: 30,
                      endIndent: 30,
                      color: Colors.black12,
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.all(8),
                      title: Text(
                        "Set Card Limit",
                        style: textStyle(14, FontWeight.w500, Colors.black),
                      ),
                      subtitle: Text(
                        "You set budget for 3 categories",
                        style: textStyle(12, FontWeight.w400, Colors.black54),
                      ),
                      trailing: Text(
                        "\$100.00",
                        style: textStyle(14, FontWeight.w600, Colors.black),
                      ),
                    ),
                    const Divider(
                      height: 1,
                      indent: 30,
                      endIndent: 30,
                      color: Colors.black12,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
