import 'package:adabank/controller/navigation_controller.dart';
import 'package:adabank/controller/profile/profile_controller.dart';
import 'package:adabank/theme/shared_style.dart';
import 'package:adabank/view/user_profile/detail_profile_bottom_sheet.dart';
import 'package:adabank/view/user_profile/profile_settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Widget profileScreenBottomSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.42,
      minChildSize: 0.3,
      maxChildSize: 0.68,
      snap: true,
      snapAnimationDuration: const Duration(milliseconds: 300),
      builder: (context, scrollController) => Container(
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
        ),
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 28, left: 8, bottom: 5),
                child: Text(
                  "General",
                  style: textStyle(14, FontWeight.w500, Colors.black45),
                ),
              ),
              ListTile(
                leading: SvgPicture.asset("assets/svg/onlinePayment.svg"),
                title: Text(
                  "Online Payment",
                  style: textStyle(14, FontWeight.w500, Colors.black),
                ),
                subtitle: Text(
                  "Unblock PIN or CVV and more",
                  style: textStyle(12, FontWeight.w400, Colors.black54),
                ),
                trailing: Obx(
                  () => Switch(
                    value: ProfileController.onlinePaymentLight.value,
                    activeTrackColor: const Color.fromARGB(255, 16, 96, 72),
                    onChanged: (bool value) {
                      ProfileController.onlinePaymentLight.value = value;
                    },
                  ),
                ),
              ),
              ListTile(
                leading: SvgPicture.asset("assets/svg/atmWithdraw.svg"),
                title: Text(
                  "ATM Withdrawal",
                  style: textStyle(14, FontWeight.w500, Colors.black),
                ),
                subtitle: Text(
                  "Enable cash withdrawals",
                  style: textStyle(12, FontWeight.w400, Colors.black54),
                ),
                trailing: Obx(
                  () => Switch(
                    value: ProfileController.atmWithdrawalLight.value,
                    activeTrackColor: const Color.fromARGB(255, 16, 96, 72),
                    onChanged: (bool value) {
                      ProfileController.atmWithdrawalLight.value = value;
                    },
                  ),
                ),
              ),
              ListTile(
                leading: Image.asset("assets/images/paymentAbroad.png"),
                title: Text(
                  "Payment Abroad",
                  style: textStyle(14, FontWeight.w500, Colors.black),
                ),
                subtitle: Text(
                  "Unblock PIN or CVV and more",
                  style: textStyle(12, FontWeight.w400, Colors.black54),
                ),
                trailing: Obx(
                  () => Switch(
                    value: ProfileController.paymentAbroadLight.value,
                    activeTrackColor: const Color.fromARGB(255, 16, 96, 72),
                    onChanged: (bool value) {
                      ProfileController.paymentAbroadLight.value = value;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 8, bottom: 5),
                child: Text(
                  "Help Support",
                  style: textStyle(14, FontWeight.w500, Colors.black45),
                ),
              ),
              ListTile(
                leading: SvgPicture.asset("assets/svg/onlinePayment.svg"),
                title: Text(
                  "Online Payment",
                  style: textStyle(14, FontWeight.w500, Colors.black),
                ),
                subtitle: Text(
                  "Unblock PIN or CVV and more",
                  style: textStyle(12, FontWeight.w400, Colors.black54),
                ),
                trailing: Obx(
                  () => Switch(
                    value: ProfileController.onlinePaymentLight.value,
                    activeTrackColor: const Color.fromARGB(255, 16, 96, 72),
                    onChanged: (bool value) {
                      ProfileController.onlinePaymentLight.value = value;
                    },
                  ),
                ),
              ),
              ListTile(
                leading: SvgPicture.asset("assets/svg/atmWithdraw.svg"),
                title: Text(
                  "ATM Withdrawal",
                  style: textStyle(14, FontWeight.w500, Colors.black),
                ),
                subtitle: Text(
                  "Enable cash withdrawals",
                  style: textStyle(12, FontWeight.w400, Colors.black54),
                ),
                trailing: Obx(
                  () => Switch(
                    value: ProfileController.atmWithdrawalLight.value,
                    activeTrackColor: const Color.fromARGB(255, 16, 96, 72),
                    onChanged: (bool value) {
                      ProfileController.atmWithdrawalLight.value = value;
                    },
                  ),
                ),
              ),
              ListTile(
                leading: Image.asset("assets/images/paymentAbroad.png"),
                title: Text(
                  "Payment Abroad",
                  style: textStyle(14, FontWeight.w500, Colors.black),
                ),
                subtitle: Text(
                  "Unblock PIN or CVV and more",
                  style: textStyle(12, FontWeight.w400, Colors.black54),
                ),
                trailing: Obx(
                  () => Switch(
                    value: ProfileController.paymentAbroadLight.value,
                    activeTrackColor: const Color.fromARGB(255, 16, 96, 72),
                    onChanged: (bool value) {
                      ProfileController.paymentAbroadLight.value = value;
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 16, 96, 72),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 75,
            top: 35,
            child: Container(
              width: 400,
              height: 400,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                // color: Color.fromARGB(17, 255, 255, 255),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.transparent,
                    Color.fromARGB(85, 255, 255, 255)
                  ],
                ),
              ),
            ),
          ),
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
          Positioned(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 45, left: 25, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Profile",
                        style: textStyle(16, FontWeight.w500, Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          pushScreen(context, const ProfileSettingsScreen());
                        },
                        child: const Icon(
                          Icons.settings_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.075),
                Container(
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
                        backgroundColor: const Color.fromARGB(255, 16, 96, 72),
                        child: Image.asset("assets/images/profile.png"),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Change & Store",
                  style: textStyle(24, FontWeight.w500, Colors.white),
                ),
                const SizedBox(height: 5),
                Text(
                  "changeandstore@gmail.com",
                  style: textStyle(14, FontWeight.w500, Colors.white38),
                ),
                SizedBox(height: height * 0.05),
                Container(
                  width: width - 50,
                  height: 175,
                  margin: const EdgeInsets.only(bottom: 35),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Personal Account Information",
                        style: textStyle(16, FontWeight.w500, Colors.black),
                      ),
                      const Divider(
                        height: 38,
                        indent: 30,
                        endIndent: 30,
                        color: Colors.black12,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$Castag",
                              style: textStyle(
                                  14, FontWeight.w500, Colors.black45),
                            ),
                            Text(
                              "\$nextarui",
                              style: textStyle(
                                  14, FontWeight.w600, Colors.black87),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25, right: 25, top: 18, bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Account Number",
                              style: textStyle(
                                  14, FontWeight.w500, Colors.black45),
                            ),
                            Text(
                              "903402383011",
                              style: textStyle(
                                  14, FontWeight.w600, Colors.black87),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          detailProfileBottomSheet(context);
                        },
                        child: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          profileScreenBottomSheet(),
        ],
      ),
    );
  }
}
