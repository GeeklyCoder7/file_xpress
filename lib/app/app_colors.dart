import 'package:flutter/material.dart';

/// Custom color palette for the File Sharing App
class AppColors {
  AppColors._(); // Private constructor

  // 🎯 PRIMARY COLORS
  static const Color primaryBlue = Color(0xFF1976D2);
  static const Color primaryBlueLight = Color(0xFF42A5F5);
  static const Color primaryBlueDark = Color(0xFF0D47A1);

  // 🌟 ACCENT COLORS
  static const Color accentOrange = Color(0xFFFF6B35);
  static const Color accentOrangeLight = Color(0xFFFFAB91);

  // ✅ SUCCESS COLORS
  static const Color successGreen = Color(0xFF4CAF50);
  static const Color successGreenLight = Color(0xFF81C784);

  // ❌ ERROR COLORS
  static const Color errorRed = Color(0xFFE53935);
  static const Color errorRedLight = Color(0xFFEF5350);

  // 🌈 NEUTRAL COLORS
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightGray = Color(0xFFF5F5F5);
  static const Color darkGray = Color(0xFF616161);
  static const Color almostBlack = Color(0xFF212121);

  // 🗂️ FILE TYPE COLORS
  static const Color fileDocument = Color(0xFF1976D2);
  static const Color fileImage = Color(0xFF4CAF50);
  static const Color fileVideo = Color(0xFFE91E63);
  static const Color fileAudio = Color(0xFFFF9800);
  static const Color fileApk = Color(0xFF9C27B0);

  /// Get color based on file extension
  static Color getFileTypeColor(String extension) {
    switch (extension.toLowerCase()) {
      case '.pdf':
      case '.doc':
      case '.docx':
      case '.txt':
        return fileDocument;
      case '.jpg':
      case '.jpeg':
      case '.png':
      case '.gif':
        return fileImage;
      case '.mp4':
      case '.avi':
      case '.mov':
        return fileVideo;
      case '.mp3':
      case '.wav':
      case '.aac':
        return fileAudio;
      case '.apk':
        return fileApk;
      default:
        return darkGray;
    }
  }

  /// Material Theme with custom colors
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryBlue,
        primary: primaryBlue,
        onPrimary: white,
        secondary: accentOrange,
        onSecondary: white,
        error: errorRed,
        onError: white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryBlue,
        foregroundColor: white,
        centerTitle: true,
        elevation: 4,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
          foregroundColor: white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
