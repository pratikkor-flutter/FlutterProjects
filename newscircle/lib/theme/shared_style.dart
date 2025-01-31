import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double width = 0;
double height = 0;

void setDeviceSize(
    {required double deviceWidth, required double deviceHeight}) {
  width = deviceWidth;
  height = deviceHeight;
}

TextStyle textStyle(double? fontSize, FontWeight? fontWeight, Color? color) {
  double sizeFactor = 0;
  if (height <= 700) {
    sizeFactor = 1;
  }
  return GoogleFonts.poppins(
    color: color,
    fontWeight: fontWeight,
    fontSize: fontSize! - sizeFactor,
  );
}
