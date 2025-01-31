import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late dynamic homeTabController;

  @override
  void onInit() {
    super.onInit();
    homeTabController = TabController(length: 2, vsync: this);
    homeTabController.addListener(() {});
  }
}
