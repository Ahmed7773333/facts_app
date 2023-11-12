import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static TextStyle factStyle = GoogleFonts.urbanist(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static TextStyle subTitleStyle = GoogleFonts.urbanist(
    color: const Color(0xFFFE7D07),
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );
  static TextStyle buttonStyle = GoogleFonts.urbanist(
    color: const Color(0xFFFE7D07),
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
  static ThemeData mode = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      titleTextStyle: GoogleFonts.urbanist(
        color: const Color(0xFFFE7D07),
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusColor: const Color(0xFFFE7D07),
      fillColor: Colors.white,
      filled: true,
      hintStyle: GoogleFonts.urbanist(
        color: const Color(0xFF8390A1),
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Color(0xFFFE7D07),
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Color(0xFFFE7D07),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Color(0xFFFE7D07),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Color(0xFFFE7D07),
        ),
      ),
      errorStyle: GoogleFonts.urbanist(
        color: Colors.red,
        fontSize: 11,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
