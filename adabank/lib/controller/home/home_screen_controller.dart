import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeScreenController extends GetxController {
  static RxInt value = RxInt(-1);
  static RxBool showBalance = true.obs;

  static List<DropdownMenuItem<dynamic>> currencyCode = [
    const DropdownMenuItem(
      value: -1,
      alignment: AlignmentDirectional.center,
      child: Text(
        "USD",
      ),
    ),
    const DropdownMenuItem(
      value: 1,
      alignment: AlignmentDirectional.center,
      child: Text("EUR"),
    ),
    const DropdownMenuItem(
      value: 2,
      alignment: AlignmentDirectional.center,
      child: Text("INR"),
    ),
    const DropdownMenuItem(
      value: 3,
      alignment: AlignmentDirectional.center,
      child: Text("JPY"),
    ),
    const DropdownMenuItem(
      value: 4,
      alignment: AlignmentDirectional.center,
      child: Text("Ruble"),
    ),
    const DropdownMenuItem(
      value: 5,
      alignment: AlignmentDirectional.center,
      child: Text("GBP"),
    ),
  ];
}
