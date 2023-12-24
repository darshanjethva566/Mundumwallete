import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle googleDmSansTextStyle({
  required double fontSize,
  required FontWeight fontWeight,
  Color color = Colors.white,
  double? letterSpacing,
  double? height,
  // TextOverflow? overflow,

}) =>
    GoogleFonts.dmSans(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      height: height,
    );

TextStyle googlePoppinsSansTextStyle({
  required double fontSize,
  required FontWeight fontWeight,
  Color color = Colors.white,
  double? letterSpacing,
  double? height,

}) =>
    GoogleFonts.poppins(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      height: height,
    );
