import 'package:adabank/bindings/bindings.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: navbarController.controller,
      screens: navbarController.navbarScreens(),
      items: navbarController.navbarIcons(),
      navBarStyle: NavBarStyle.style16,
      navBarHeight: 60,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(30),
        colorBehindNavBar: const Color.fromARGB(245, 245, 245, 245),
        boxShadow: [
          const BoxShadow(
              color: Colors.black38, blurRadius: 20, spreadRadius: 0.2)
        ],
      ),
    );
  }
}
