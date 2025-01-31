import 'package:adabank/firebase/firestore_data_manipulations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TransferScreenController extends GetxController {
  static RxList<bool> transferMode = [true, false, false].obs;
  static RxInt contactSelection = 0.obs;
  static RxString transferAmount = "".obs;
  static RxBool isFinished = false.obs;

  static RxInt categoryValue = RxInt(-1);

  static RxList<DropdownMenuItem<dynamic>> categoriesList = [
    DropdownMenuItem(
      value: -1,
      alignment: AlignmentDirectional.center,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgPicture.asset(
              "assets/svg/camera.svg",
              fit: BoxFit.none,
            ),
          ),
          const Text("Equipment"),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 1,
      alignment: AlignmentDirectional.center,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgPicture.asset(
              "assets/svg/game.svg",
              fit: BoxFit.none,
            ),
          ),
          const Text("Entertainment"),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 2,
      alignment: AlignmentDirectional.center,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgPicture.asset(
              "assets/svg/play.svg",
              fit: BoxFit.none,
            ),
          ),
          const Text("Streaming"),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 3,
      alignment: AlignmentDirectional.center,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgPicture.asset(
              "assets/svg/reserve.svg",
              fit: BoxFit.none,
            ),
          ),
          const Text("Food"),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 4,
      alignment: AlignmentDirectional.center,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgPicture.asset(
              "assets/svg/buy.svg",
              fit: BoxFit.none,
            ),
          ),
          const Text("Shopping"),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 5,
      alignment: AlignmentDirectional.center,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgPicture.asset(
              "assets/svg/location.svg",
              fit: BoxFit.none,
            ),
          ),
          const Text("Travel"),
        ],
      ),
    ),
  ].obs;

  static void initTransaction() {
    // to change the balance amount when transaction complete
    userProfile.balance.value -= int.parse(transferAmount.value);
    transferAmount = "".obs;
  }
}
