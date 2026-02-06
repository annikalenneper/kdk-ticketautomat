import 'package:flutter/material.dart';
import '../styles/app_colors.dart';

/// Runder Button für das Hilfe-Center
class HelpCenterButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double size;

  const HelpCenterButton({
    super.key,
    required this.onPressed,
    this.size = 140,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.grey[800],
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(128),
              blurRadius: 8,
              offset: const Offset(4, 4),
            ),
            BoxShadow(
              color: Colors.white.withAlpha(26),
              blurRadius: 8,
              offset: const Offset(-4, -4),
            ),
          ],
        ),
        child: Center(
          child: Container(
            width: size * 0.85,
            height: size * 0.85,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primaryRed, AppColors.primaryRedDark],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
              boxShadow: [
                // Inner shadow effect
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 3,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.question_mark_rounded,
                  size: 40,
                  color: AppColors.textLight,
                  shadows: [
                    Shadow(
                      color: Colors.black.withAlpha(102),
                      blurRadius: 4,
                      offset: const Offset(2, 2),
                    )
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'HILFE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textLight,
                    letterSpacing: 1.5,
                    shadows: [
                      Shadow(
                        color: Colors.black.withAlpha(128),
                        blurRadius: 3,
                        offset: const Offset(1, 1),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
