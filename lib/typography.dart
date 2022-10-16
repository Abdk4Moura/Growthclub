import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growthclub/themes.dart';

class GTheme {
  static const TextStyle montserrat = TextStyle(fontFamily: 'Montserrat');
  static final TextStyle poppins = GoogleFonts.poppins(color: Colors.black);
  static final TextStyle bodyText1 =
      poppins.copyWith(fontSize: 11, fontWeight: FontWeight.w200);
  static final TextStyle bodyText2 =
      poppins.copyWith(fontSize: 14, fontWeight: FontWeight.w400);
  static final TextStyle bodyText3 = poppins.copyWith(fontSize: 16.83);
  static final TextStyle subtitle2 = poppins.copyWith(fontSize: 16);
  static final TextStyle subtitle1 = poppins.copyWith(fontSize: 18);
  static final TextStyle title3 = montserrat.copyWith(fontSize: 22);
  static final TextStyle title2 =
      montserrat.copyWith(fontSize: 24, fontWeight: FontWeight.w700);
  static final TextStyle title1 = montserrat.copyWith(fontSize: 34);
  static final TextStyle inputHintText = GoogleFonts.nunito(
      fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black45);
  static const Color secondaryColor = Color(0xFFDAEAF1);
  static const Color canvasColor = Color(0xFFD0EEFA);
  static const Color primaryButtonColor = Color(0xFF26A0D3);
  static const Color primaryButtonHoverColor = Color(0xFF26A0D3);
  static final TextStyle smallSubtitle =
      poppins.copyWith(fontSize: 10, fontWeight: FontWeight.w300);
  static const Color TextButtonOriginalColor = Colors.black;
  static const Color mainIconColor = Colors.black;
}

final GBorderRadius = BorderRadius.circular(4);
