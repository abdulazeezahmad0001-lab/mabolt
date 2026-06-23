// rider_app/lib/features/auth/presentation/screens/splash_screen.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'onboarding_screen.dart';
import 'route_path_painter.dart';
// 👈 Update this import to wherever FallbackImage actually lives in your project
import '../../../../shared/widgets/fallback_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  static const _amber = Color(0xFFF59E0B);
  static const _amberDark = Color(0xFFD97706);
  // Deep navy derived from the brand blue, used as the splash backdrop.
  // Kept separate from AppColors.primary (which is a vivid blue) because
  // a saturated blue at full-bleed fights with the photo and the amber
  // accents. Swap this for AppColors.primaryDark directly if you'd
  // rather have a punchier, bluer background.
  static const _navy = Color(0xFF0B1A33);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2400),
    )..repeat();

    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: _navy,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image — falls back to a gradient if the asset is missing
          const FallbackImage(assetPath: 'assets/images/splash_bg.jpg'),

          // Brand-tinted scrim instead of a flat black overlay
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  _navy.withOpacity(0.35),
                  _navy.withOpacity(0.55),
                  _navy.withOpacity(0.92),
                ],
                stops: const [0.0, 0.45, 1.0],
              ),
            ),
          ),

          // Soft amber glow behind the logo, for depth
          Positioned(
            top: size.height * 0.30,
            left: size.width * 0.5 - 90,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [_amber.withOpacity(0.35), _amber.withOpacity(0.0)],
                ),
              ),
            ),
          ),

          // Main lockup — shifted to the lower-middle third, not dead center
          Align(
            alignment: const Alignment(0, 0.05),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [_amber, _amberDark],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: _amber.withOpacity(0.45),
                        blurRadius: 30,
                        spreadRadius: 2,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.bolt_rounded,
                      color: Colors.white, size: 46),
                )
                    .animate()
                    .scale(
                      duration: 600.ms,
                      curve: Curves.easeOutBack,
                      begin: const Offset(0.6, 0.6),
                    )
                    .fadeIn(duration: 400.ms),

                const SizedBox(height: 22),

                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 4,
                    ),
                    children: [
                      TextSpan(
                          text: 'MA', style: TextStyle(color: Colors.white)),
                      TextSpan(text: 'BOLT', style: TextStyle(color: _amber)),
                    ],
                  ),
                )
                    .animate()
                    .fadeIn(delay: 200.ms, duration: 500.ms)
                    .slideY(begin: 0.2, end: 0),

                const SizedBox(height: 8),

                Container(
                  width: 36,
                  height: 3,
                  decoration: BoxDecoration(
                    color: _amber,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ).animate().fadeIn(delay: 400.ms),

                const SizedBox(height: 14),

                Text(
                  'Your ride, your way',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white.withOpacity(0.75),
                    fontWeight: FontWeight.w300,
                    letterSpacing: 2,
                  ),
                ).animate().fadeIn(delay: 500.ms, duration: 500.ms),
              ],
            ),
          ),

          // Signature route-line motif, just above the loading bar
          Positioned(
            left: 40,
            right: 40,
            bottom: 96,
            child: SizedBox(
              height: 28,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, _) => CustomPaint(
                  painter: RoutePathPainter(
                    progress: _controller.value,
                    lineColor: Colors.white.withOpacity(0.35),
                    pinColor: _amber,
                  ),
                ),
              ),
            ),
          ).animate().fadeIn(delay: 700.ms, duration: 500.ms),

          // Loading bar — now actually animated, sweeping left to right on a loop
          Positioned(
            bottom: 56,
            left: 0,
            right: 0,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 120,
                    height: 3,
                    color: Colors.white.withOpacity(0.15),
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, _) => Align(
                        alignment: Alignment((_controller.value * 2) - 1, 0),
                        child: Container(
                          width: 40,
                          height: 3,
                          decoration: BoxDecoration(
                            gradient:
                                const LinearGradient(colors: [_amber, _amberDark]),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  'Version 1.0.0',
                  style:
                      TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}