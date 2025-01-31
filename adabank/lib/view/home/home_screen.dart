import 'package:adabank/controller/home/home_screen_controller.dart';
import 'package:adabank/controller/navigation_controller.dart';
import 'package:adabank/firebase/firestore_data_manipulations.dart';
import 'package:adabank/theme/shared_style.dart';
import 'package:adabank/view/home/home_screen_bottomsheet.dart';
import 'package:adabank/view/menu_screen.dart';
import 'package:adabank/view/transfer/transfer_screen.dart';
import 'package:adabank/view/user_profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 25,
              left: 25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome",
                    style: textStyle(16, FontWeight.w400, Colors.white54),
                  ),
                  Text(
                    "Change & Store",
                    style: textStyle(24, FontWeight.w500, Colors.white),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 20,
              right: 25,
              child: GestureDetector(
                onTap: () {
                  pushScreen(context, const ProfileScreen());
                },
                child: Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: const Color.fromARGB(255, 95, 163, 143),
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: FractionallySizedBox(
                      heightFactor: 1,
                      widthFactor: 1,
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Image.asset("assets/images/profile.png"),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: height * 0.15,
              left: 25,
              child: Container(
                width: width - 50,
                height: height * 0.35,
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
                        "Total Balance",
                        style: textStyle(14, FontWeight.w400, Colors.white70),
                      ),
                    ),
                    Positioned(
                      top: 18.5,
                      right: 20,
                      child: Obx(
                        () => HomeScreenController.showBalance.value
                            ? GestureDetector(
                                onTap: () {
                                  HomeScreenController.showBalance.value =
                                      false;
                                },
                                child: const Icon(
                                  Icons.visibility_outlined,
                                  color: Colors.white60,
                                  size: 20.5,
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  HomeScreenController.showBalance.value = true;
                                },
                                child: const Icon(
                                  Icons.visibility_off_outlined,
                                  color: Colors.white60,
                                  size: 20.5,
                                ),
                              ),
                      ),
                    ),
                    Center(
                      heightFactor: 2.75,
                      child: Obx(
                        () => Text(
                          HomeScreenController.showBalance.value
                              ? "\$${userProfile.balance.value}"
                              : "\$ * * * ",
                          style: textStyle(40, FontWeight.w600, Colors.white),
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
                      top: height * 0.22,
                      left: 0,
                      right: 0,
                      child: Row(
                        children: [
                          const Spacer(),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  pushScreen(context, const TransferScreen());
                                },
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: SvgPicture.asset(
                                    "assets/svg/transfer.svg",
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  "Transfer",
                                  style: textStyle(
                                    13,
                                    FontWeight.w400,
                                    Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              GestureDetector(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: SvgPicture.asset(
                                    "assets/svg/topup.svg",
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  "Top-Up",
                                  style: textStyle(
                                    13,
                                    FontWeight.w400,
                                    Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              GestureDetector(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: SvgPicture.asset(
                                    "assets/svg/bill.svg",
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  "Bill",
                                  style: textStyle(
                                    13,
                                    FontWeight.w400,
                                    Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  pushScreen(
                                      context, const MenuScreen(), false);
                                },
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: SvgPicture.asset(
                                    "assets/svg/more.svg",
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  "More",
                                  style: textStyle(
                                    13,
                                    FontWeight.w400,
                                    Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const HomeScreenBottomsheet(),
          ],
        ),
      ),
    );
  }
}
