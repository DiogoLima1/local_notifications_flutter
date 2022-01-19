import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluishClr = Color(0xFF4e5ae8);
const Color yellowClr = Color(0xFF4e5ae8);
const Color pinkClr = Color(0xFF4e5ae8);
const Color white = Colors.white;
const Color primaryClr = Color(0xFFD1DB98);
const Color darkModeClr = Color(0xFF827896);
const Color darkGreyClr = Color(0xFF121212);
const Color darkHeaderClr = Color(0xFF424242);

class Themes {
  static final light = ThemeData(
    backgroundColor: primaryClr,
    primaryColor: primaryClr,
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    backgroundColor: darkModeClr,
    primaryColor: darkGreyClr,
    brightness: Brightness.dark,
  );
}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Get.isDarkMode ? darkModeClr : darkGreyClr,
  ));
}

TextStyle get subHeadingStyle2 {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 37,
    fontWeight: FontWeight.bold,
    color: Get.isDarkMode ? Colors.white : darkGreyClr,
  ));
}

TextStyle get headingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Get.isDarkMode ? darkModeClr : darkGreyClr,
  ));
}
