import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class StylesData {
  static TextStyle font35 = GoogleFonts.cairo(
    textStyle: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: 35,
    ),
  );
  static TextStyle font25 = GoogleFonts.cairo(
    textStyle: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 25,
    ),
  );
  static TextStyle font24 = GoogleFonts.inter(
    textStyle: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 24,
    ),
  );
  static TextStyle font20 = GoogleFonts.inter(
    textStyle: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 20,
    ),
  );
  static TextStyle fontInter15 = GoogleFonts.inter(
    textStyle: TextStyle(
      color: Colors.black.withOpacity(.6),
      fontWeight: FontWeight.w300,
      fontSize: 15,
    ),
  );
  static TextStyle font15 = GoogleFonts.cairo(
    textStyle: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 15,
    ),
  );
}
