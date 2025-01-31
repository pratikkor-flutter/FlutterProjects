import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

// use PersistentNavBarNavigator for withNavBar property
void pushScreen(BuildContext context, Widget screen,
    [bool withNavBar = false]) {
  PersistentNavBarNavigator.pushNewScreen(
    context,
    screen: screen,
    withNavBar: withNavBar,
    pageTransitionAnimation: PageTransitionAnimation.cupertino,
  );
}

void popScreen(BuildContext context) {
  PersistentNavBarNavigator.pop(
    context,
  );
}
