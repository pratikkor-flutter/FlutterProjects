import 'package:adabank/controller/profile/profile_controller.dart';
import 'package:adabank/theme/shared_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileSettingsScreen extends StatelessWidget {
  const ProfileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 16, 96, 72),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 16, 96, 72),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 15,
            height: 15,
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: const Icon(
              Icons.arrow_back_rounded,
              color: Color.fromARGB(255, 16, 96, 72),
            ),
          ),
        ),
        title: Text(
          "Settings",
          style: textStyle(16, FontWeight.w500, Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
            child: Text(
              "Security",
              style: textStyle(14, FontWeight.w500, Colors.white),
            ),
          ),
          Container(
            height: 320,
            padding: const EdgeInsets.only(bottom: 20),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) => ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                leading: SizedBox(
                  width: 50,
                  height: 50,
                  child: SvgPicture.asset(
                      ProfileController.settingItems[index][0]),
                ),
                title: Text(
                  ProfileController.settingItems[index][1],
                  style: textStyle(14, FontWeight.w500,
                      const Color.fromARGB(215, 255, 255, 255)),
                ),
                trailing: (index == 3)
                    ? Obx(
                        () => Switch(
                          value: ProfileController.turfOffCardLight.value,
                          activeTrackColor: Colors.white24,
                          onChanged: (bool value) {
                            ProfileController.turfOffCardLight.value = value;
                          },
                        ),
                      )
                    : const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                        size: 16,
                      ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
            child: Text(
              "Language",
              style: textStyle(14, FontWeight.w500, Colors.white),
            ),
          ),
          Container(
            height: 95,
            padding: const EdgeInsets.only(bottom: 20),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              leading: SizedBox(
                width: 50,
                height: 50,
                child: SvgPicture.asset("assets/svg/changeLanguage.svg"),
              ),
              title: Text(
                "Change Language",
                style: textStyle(14, FontWeight.w500,
                    const Color.fromARGB(215, 255, 255, 255)),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
            child: Text(
              "Other",
              style: textStyle(14, FontWeight.w500, Colors.white),
            ),
          ),
          Container(
            height: 95,
            padding: const EdgeInsets.only(bottom: 20),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              leading: SizedBox(
                width: 50,
                height: 50,
                child: SvgPicture.asset("assets/svg/changeTheme.svg"),
              ),
              title: Text(
                "Dark Theme",
                style: textStyle(14, FontWeight.w500,
                    const Color.fromARGB(215, 255, 255, 255)),
              ),
              trailing: Obx(
                () => Switch(
                  value: ProfileController.darkThemeLight.value,
                  activeTrackColor: Colors.white24,
                  onChanged: (bool value) {
                    ProfileController.darkThemeLight.value = value;
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
