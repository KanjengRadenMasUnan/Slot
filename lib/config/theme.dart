import 'package:flutter/material.dart';

class CasinoTheme {
  // Palette Warna Internasional
  static const Color bgDark = Color(0xFF0F1923);       // Background Utama
  static const Color sidebarColor = Color(0xFF0B1219); // Sidebar Kiri
  static const Color cardColor = Color(0xFF1A242D);    // Warna Kartu/Panel
  static const Color accentGreen = Color(0xFF00E701);  // Warna Hijau (Tombol/Menang)
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textGrey = Color(0xFF8F9CA9);

  // Gaya Text Global
  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: bgDark,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontFamily: 'Roboto', color: textWhite),
      ),
    );
  }
}