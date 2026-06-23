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
          // Full-bleed background image, edge to edge
          const FallbackImage(assetPath: 'assets/images/splash_bg.jpg'),

          // Low-opacity tint — the photo stays visible, this just keeps
          // white text readable on top of it. Tune the 0.15-0.55 numbers
          // up if your actual photo is busier/brighter than this looks.
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  _navy.withOpacity(0.15),
                  _navy.withOpacity(0.35),
                  _navy.withOpacity(0.55),
                ],
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
          ),

          // Logo — centered near the top. Drop your asset at
          // assets/images/logo.png; falls back to a translucent box
          // with a bolt icon until it's there.
          Positioned(
            top: size.height * 0.10,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 78,
                height: 78,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.bolt_rounded,
                    color: _amber,
                    size: 40,
                  ),
                ),
              ),
            ),
          ).animate().fadeIn(duration: 400.ms).scale(
                begin: const Offset(0.85, 0.85),
                curve: Curves.easeOutBack,
              ),

          // Main lockup — wordmark + tagline, centered
          Align(
            alignment: const Alignment(0, 0.05),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                    color: Colors.white.withOpacity(0.85),
                    fontWeight: FontWeight.w300,
                    letterSpacing: 2,
                  ),
                ).animate().fadeIn(delay: 500.ms, duration: 500.ms),
              ],
            ),
          ),

          // Signature route-line motif
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
                    lineColor: Colors.white.withOpacity(0.4),
                    pinColor: _amber,
                  ),
                ),
              ),
            ),
          ).animate().fadeIn(delay: 700.ms, duration: 500.ms),

          // Looping progress bar
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
                    color: Colors.white.withOpacity(0.2),
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
                      TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}