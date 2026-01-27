import 'package:flutter/material.dart';

class CasinoTheme {
  // ================= COLORS =================
  // Background Utama (Sangat Gelap)
  static const Color background = Color(0xFF0D1117);
  static const Color bgDark = Color(
    0xFF0D1117,
  ); // FIX: Tambahan alias untuk 'bgDark'

  // Warna Card / Sidebar (Agak Terang dikit)
  static const Color cardColor = Color(0xFF161B22);
  static const Color sidebarColor = Color(
    0xFF161B22,
  ); // FIX: Tambahan alias untuk 'sidebarColor'

  // Aksen Warna
  static const Color primaryGold = Color(0xFFFFD700); // Emas
  static const Color accentGreen = Color(0xFF00E676); // Hijau Menang
  static const Color textWhite = Colors.white;
  static const Color textGrey = Colors.white54;

  // ================= GRADIENTS =================
  static const LinearGradient goldGradient = LinearGradient(
    colors: [Color(0xFFFFA000), Color(0xFFFFD700)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // ================= THEME DATA (FIX ERROR darkTheme) =================
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      primaryColor: primaryGold,
      cardColor: cardColor,

      // Setting AppBar Default
      appBarTheme: const AppBarTheme(
        backgroundColor: cardColor,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),

      // Setting Input Field Default
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white.withOpacity(0.05),
        labelStyle: const TextStyle(color: textGrey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryGold),
        ),
      ),

      // Font Default
      fontFamily: 'Roboto', // Pastikan font ini ada atau ganti dengan default
      colorScheme: const ColorScheme.dark(
        primary: primaryGold,
        secondary: accentGreen,
        surface: cardColor,
        background: background,
      ),
    );
  }

  // ================= HELPERS =================
  static InputDecoration inputDecor(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: primaryGold),
    );
  }
}
