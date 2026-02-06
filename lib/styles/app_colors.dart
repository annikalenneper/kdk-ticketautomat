import 'package:flutter/material.dart';

/// App-Farbschema
class AppColors {
  /// Primärfarbe für Buttons und wichtige Elemente
  static const Color primaryRed = Color(0xFFD32F2F); // Corresponds to Colors.red[700]
  
  /// Dunklerer Rot-Ton für Farbverläufe
  static const Color primaryRedDark = Color(0xFFB71C1C); // Corresponds to Colors.red[900]

  /// Helle Akzentfarbe für Text auf dunklen Hintergründen
  static const Color textLight = Colors.white;

  /// Dunkle Akzentfarbe für Text auf hellen Hintergründen
  static const Color textDark = Colors.black87;

  /// Grauton für neutrale Elemente wie den Floating Action Button
  static Color? accentGrey = Colors.grey[800];
}
