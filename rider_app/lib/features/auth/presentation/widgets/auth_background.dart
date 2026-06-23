// lib/features/auth/presentation/widgets/auth_background.dart
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;
  final String imagePath;
  final double overlayOpacity;

  const AuthBackground({
    super.key,
    required this.child,
    required this.imagePath,
    this.overlayOpacity = 0.7,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(overlayOpacity),
            BlendMode.darken,
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primary.withOpacity(0.3),
              AppColors.amber.withOpacity(0.1),
              Colors.black.withOpacity(0.6),
            ],
            stops: const [0.0, 0.4, 1.0],
          ),
        ),
        child: SafeArea(
          child: child,
        ),
      ),
    );
  }
}