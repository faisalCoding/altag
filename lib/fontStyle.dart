import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle h1({color, s = 25.0}) =>
    GoogleFonts.tajawal(fontSize: s, color: color, fontWeight: FontWeight.bold);

TextStyle h2(color, double size) => GoogleFonts.tajawal(
      fontSize: size ?? 20,
      color: color,
    );
TextStyle h3({color, double size}) => GoogleFonts.tajawal(
      fontSize: size ?? 17,
      color: color,
    );

TextStyle ls({color, double size, bool lineThrough = true}) =>
    GoogleFonts.tajawal(
        fontSize: size ?? 9,
        color: color,
        decoration: lineThrough ? null : TextDecoration.lineThrough);
