import 'package:flutter/material.dart';
import 'package:adabank/theme/shared_style.dart';

final gridFiller = [
  Text(
    "1",
    style: textStyle(30, FontWeight.w500, Colors.black),
  ),
  Text(
    "2",
    style: textStyle(30, FontWeight.w500, Colors.black),
  ),
  Text(
    "3",
    style: textStyle(30, FontWeight.w500, Colors.black),
  ),
  Text(
    "4",
    style: textStyle(30, FontWeight.w500, Colors.black),
  ),
  Text(
    "5",
    style: textStyle(30, FontWeight.w500, Colors.black),
  ),
  Text(
    "6",
    style: textStyle(30, FontWeight.w500, Colors.black),
  ),
  Text(
    "7",
    style: textStyle(30, FontWeight.w500, Colors.black),
  ),
  Text(
    "8",
    style: textStyle(30, FontWeight.w500, Colors.black),
  ),
  Text(
    "9",
    style: textStyle(30, FontWeight.w500, Colors.black),
  ),
  Text(
    ".",
    style: textStyle(30, FontWeight.w500, Colors.black),
  ),
  Text(
    "0",
    style: textStyle(30, FontWeight.w500, Colors.black),
  ),
  Container(
    width: 25,
    height: 25,
    decoration: BoxDecoration(
      color: Colors.black87,
      borderRadius: BorderRadius.circular(360),
    ),
    child: const Icon(
      Icons.arrow_back_ios_new_rounded,
      color: Colors.white,
      size: 16,
    ),
  ),
];

final Map<int, String> digits = {
  0: "1",
  1: "2",
  2: "3",
  3: "4",
  4: "5",
  5: "6",
  6: "7",
  7: "8",
  8: "9",
  9: ".",
  10: "0",
  11: "backspace",
};

SizedBox numPadWidget(
  BuildContext context,
  Function inputFieldListener,
) {
  double childAspectRatio;
  if (height <= 700) {
    childAspectRatio = 2.1;
  } else {
    childAspectRatio = 1.55;
  }
  return SizedBox(
    child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: childAspectRatio),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 12,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            inputFieldListener(digits[index]);
          },
          child: Container(
            alignment: Alignment.center,
            child: gridFiller[index],
          ),
        );
      },
    ),
  );
}

Padding searchBar(String hint) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.5),
    child: SearchBar(
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Image.asset("assets/images/search.png"),
      ),
      hintText: hint,
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
      ),
      backgroundColor: const WidgetStatePropertyAll(Colors.white),
    ),
  );
}

Container customButtonWidget({
  required BuildContext context,
  required Color color,
  required String title,
  required EdgeInsets margin,
}) {
  return Container(
    width: double.maxFinite,
    height: 55,
    margin: margin,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(35),
      color: color,
    ),
    child: Center(
      child: Text(
        title,
        style: textStyle(18, FontWeight.w500, Colors.white),
      ),
    ),
  );
}
