import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class AppTextStyle{

  static final TextStyle titleTextStyle= GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold);
  static final TextStyle subTextStyle= GoogleFonts.lato(fontSize: 14,height: 1.2 ,// the height between text, default is null
      letterSpacing: 1.0);
  static final TextStyle id= GoogleFonts.lato(fontSize: 14,color: HexColor("#D20073"),fontWeight: FontWeight.w600);

}