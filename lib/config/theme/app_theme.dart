import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const seedColor = Color(0xFF07503B);

class AppTheme {
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: seedColor,
        listTileTheme: const ListTileThemeData(
          iconColor: seedColor,
        ),
        textTheme: TextTheme(
          
          titleLarge: GoogleFonts.montserratAlternates(),
          titleMedium: GoogleFonts.rubik(fontSize: 25),
        ),
      );
}
