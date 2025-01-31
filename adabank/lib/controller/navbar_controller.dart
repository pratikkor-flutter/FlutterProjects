import 'package:adabank/view/graph/net_graph_screen.dart';
import 'package:adabank/view/home/home_screen.dart';
import 'package:adabank/view/my_card/my_card_screen.dart';
import 'package:adabank/view/notification_screen.dart';
import 'package:adabank/view/qr_scanner/qr_generator_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class NavbarController extends GetxController {
  final PersistentTabController controller = PersistentTabController(
    initialIndex: 0,
  );

  List<Widget> navbarScreens() {
    return const [
      HomeScreen(),
      NetGraphScreen(),
      QrGeneratorScreen(),
      MyCardScreen(),
      NotificationScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> navbarIcons() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/svg/home.svg",
          color: const Color.fromARGB(255, 16, 96, 72),
          width: 25,
          height: 25,
        ),
        inactiveIcon: SvgPicture.asset(
          "assets/svg/home.svg",
          color: Colors.black54,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/svg/graph.svg",
          color: const Color.fromARGB(255, 16, 96, 72),
          width: 25,
          height: 25,
        ),
        inactiveIcon: SvgPicture.asset(
          "assets/svg/graph.svg",
          color: Colors.black54,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset("assets/svg/scan.svg"),
        activeColorPrimary: const Color.fromARGB(255, 16, 96, 72),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/svg/wallet.svg",
          color: const Color.fromARGB(255, 16, 96, 72),
          width: 25,
          height: 25,
        ),
        inactiveIcon: SvgPicture.asset(
          "assets/svg/wallet.svg",
          color: Colors.black54,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/svg/notification.svg",
          color: const Color.fromARGB(255, 16, 96, 72),
          width: 25,
          height: 25,
        ),
        inactiveIcon: SvgPicture.asset(
          "assets/svg/notification.svg",
          color: Colors.black54,
        ),
      ),
    ];
  }
}
