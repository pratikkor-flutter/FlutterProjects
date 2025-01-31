import 'package:adabank/firebase/firestore_data_manipulations.dart';
import 'package:adabank/theme/shared_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget headingForMyCardScreen(String heading) {
  return Positioned(
    top: height * 0.1,
    child: Text(
      heading,
      style: textStyle(20, FontWeight.w500, Colors.white),
    ),
  );
}

Widget cardAsStaticWidget() {
  return Positioned(
    top: height * 0.18,
    child: SizedBox(
      width: width * 0.9,
      height: height * 0.225,
      child: Stack(
        children: [
          Container(
            width: 250,
            padding: const EdgeInsets.all(25),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 7, 2, 25),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Current Balance",
                  style: textStyle(14, FontWeight.w500, Colors.white38),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "\$${userProfile.balance}",
                  style: textStyle(28, FontWeight.w500, Colors.white),
                ),
                const Spacer(),
                Text(
                  "5282 3456 7890 1289",
                  style: textStyle(14, FontWeight.w500, Colors.white70),
                ),
              ],
            ),
          ),
          Positioned(
            left: -150,
            bottom: -250,
            child: Container(
              width: 350,
              height: 350,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(15, 255, 255, 255),
              ),
            ),
          ),
          Positioned(
            right: 25,
            top: -75,
            child: Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(20, 255, 255, 255),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 111.5,
              padding: const EdgeInsets.symmetric(vertical: 25),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 231, 255, 174),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset("assets/svg/mastercard_logo.svg"),
                  Text(
                    "09/25",
                    style: textStyle(14, FontWeight.w600, Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
