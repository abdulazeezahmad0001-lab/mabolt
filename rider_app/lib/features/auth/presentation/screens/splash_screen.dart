// rider_app/lib/features/auth/presentation/screens/splash_screen.dart
import 'dart:async';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'onboarding_screen.dart';
// To this:
import '../../../../core/constants/app_colors.dart';
=======
import 'package:flutter_animate/flutter_animate.dart';
import 'onboarding_screen.dart';
import 'route_path_painter.dart';
// 👈 Update this import to wherever FallbackImage actually lives in your project
import '../../../../shared/widgets/fallback_image.dart';
>>>>>>> 858f468a4725940b8a5dad9c9ae2b3a432491c16

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

<<<<<<< HEAD
class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _carAnimation;
=======
class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  static const _amber = Color(0xFFF59E0B);
  static const _amberDark = Color(0xFFD97706);
<<<<<<< HEAD
=======
  // Deep navy derived from the brand blue, used as the splash backdrop.
  // Kept separate from AppColors.primary (which is a vivid blue) because
  // a saturated blue at full-bleed fights with the photo and the amber
  // accents. Swap this for AppColors.primaryDark directly if you'd
  // rather have a punchier, bluer background.
>>>>>>> d93c2721c193dc5d98f04dd5b6ac02b793cd4441
  static const _navy = Color(0xFF0B1A33);
>>>>>>> 858f468a4725940b8a5dad9c9ae2b3a432491c16

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
<<<<<<< HEAD
      duration: const Duration(seconds: 6),
    );

    _carAnimation = Tween<double>(begin: -0.1, end: 1.1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();

    Timer(const Duration(milliseconds: 6500), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => const OnboardingScreen(),
            transitionsBuilder: (_, animation, __, child) => FadeTransition(
              opacity: animation,
              child: child,
            ),
            transitionDuration: const Duration(milliseconds: 600),
          ),
=======
      duration: const Duration(milliseconds: 2400),
    )..repeat();

    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
>>>>>>> 858f468a4725940b8a5dad9c9ae2b3a432491c16
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
<<<<<<< HEAD
    return Scaffold(
      backgroundColor: AppColors.deepBlue,
      body: Stack(
        alignment: Alignment.center,
        children: [
          // ─── AMBIENT BACKGROUND GLOW ─────────────────────────
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 1.5,
                  colors: [
                    AppColors.royalBlue,
                    AppColors.deepBlue,
                    AppColors.deepBlue.withOpacity(0.8),
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
=======
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: _navy,
      body: Stack(
        fit: StackFit.expand,
        children: [
<<<<<<< HEAD
          // Full-bleed background image, edge to edge
          const FallbackImage(assetPath: 'assets/images/splash_bg.jpg'),

          // Low-opacity tint — the photo stays visible, this just keeps
          // white text readable on top of it. Tune the 0.15-0.55 numbers
          // up if your actual photo is busier/brighter than this looks.
=======
          // Background image — falls back to a gradient if the asset is missing
          const FallbackImage(assetPath: 'assets/images/splash_bg.jpg'),

          // Brand-tinted scrim instead of a flat black overlay
>>>>>>> d93c2721c193dc5d98f04dd5b6ac02b793cd4441
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
<<<<<<< HEAD
                  _navy.withOpacity(0.15),
                  _navy.withOpacity(0.35),
                  _navy.withOpacity(0.55),
                ],
                stops: const [0.0, 0.5, 1.0],
=======
                  _navy.withOpacity(0.35),
                  _navy.withOpacity(0.55),
                  _navy.withOpacity(0.92),
                ],
                stops: const [0.0, 0.45, 1.0],
>>>>>>> d93c2721c193dc5d98f04dd5b6ac02b793cd4441
>>>>>>> 858f468a4725940b8a5dad9c9ae2b3a432491c16
              ),
            ),
          ),

<<<<<<< HEAD
          // ─── GOLD ACCENT GLOW ────────────────────────────────
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.brightGold.withOpacity(0.15),
                    Colors.transparent,
                  ],
=======
<<<<<<< HEAD
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
=======
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
>>>>>>> 858f468a4725940b8a5dad9c9ae2b3a432491c16
                ),
              ),
            ),
          ),

<<<<<<< HEAD
          // ─── CENTERED BRAND CORE IDENTITY ─────────────────────
          SafeArea(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo Framework
                  SizedBox(
                    width: 140,
                    height: 80,
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.directions_car_rounded,
                          color: AppColors.brightGold,
                          size: 76,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Header Name Text
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [AppColors.brightGold, AppColors.goldenOrange],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds),
                    child: const Text(
                      'MABOLT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 7,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Accent Divider
                  Container(
                    width: 44,
                    height: 3,
                    decoration: BoxDecoration(
                      gradient: AppColors.orangeGradient,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Core Tagline
                  Text(
                    'YOUR RIDE · YOUR WAY',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.white.withOpacity(0.6),
                      fontWeight: FontWeight.w500,
                      letterSpacing: 4,
                    ),
                  ),
                  
                  const SizedBox(height: 64),

                  // ─── LINEAR PROGRESS TRACK SYSTEM ───────────────────
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        final progressValue = _controller.value;
                        final percentInt = (progressValue * 100).toInt();

                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 40,
                              width: double.infinity,
                              child: Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.bottomLeft,
                                children: [
                                  // Base Track Line
                                  Container(
                                    height: 2,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.15),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),

                                  // Active Loading Progress
                                  FractionallySizedBox(
                                    widthFactor: progressValue,
                                    child: Container(
                                      height: 2,
                                      decoration: BoxDecoration(
                                        gradient: AppColors.orangeGradient,
                                        borderRadius: BorderRadius.circular(2),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.brightGold.withOpacity(0.5),
                                            blurRadius: 8,
                                            spreadRadius: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  // Traveling Car
                                  Positioned(
                                    bottom: -10,
                                    left: 0,
                                    right: 0,
                                    child: LayoutBuilder(
                                      builder: (context, constraints) {
                                        double maxTrackWidth = constraints.maxWidth - 30;
                                        double leftOffset = _carAnimation.value * maxTrackWidth;

                                        return Transform.translate(
                                          offset: Offset(leftOffset.clamp(0.0, maxTrackWidth), 0),
                                          child: Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Icon(
                                              Icons.directions_car_rounded,
                                              color: AppColors.brightGold,
                                              size: 24,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            
                            // Percentage Text
                            Text(
                              '$percentInt%',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.4),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
=======
          // Main lockup — shifted to the lower-middle third, not dead center
>>>>>>> d93c2721c193dc5d98f04dd5b6ac02b793cd4441
          Align(
            alignment: const Alignment(0, 0.05),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
<<<<<<< HEAD
=======
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

>>>>>>> d93c2721c193dc5d98f04dd5b6ac02b793cd4441
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
<<<<<<< HEAD
                    color: Colors.white.withOpacity(0.85),
=======
                    color: Colors.white.withOpacity(0.75),
>>>>>>> d93c2721c193dc5d98f04dd5b6ac02b793cd4441
                    fontWeight: FontWeight.w300,
                    letterSpacing: 2,
                  ),
                ).animate().fadeIn(delay: 500.ms, duration: 500.ms),
              ],
            ),
          ),

<<<<<<< HEAD
          // Signature route-line motif
=======
          // Signature route-line motif, just above the loading bar
>>>>>>> d93c2721c193dc5d98f04dd5b6ac02b793cd4441
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
<<<<<<< HEAD
                    lineColor: Colors.white.withOpacity(0.4),
=======
                    lineColor: Colors.white.withOpacity(0.35),
>>>>>>> d93c2721c193dc5d98f04dd5b6ac02b793cd4441
                    pinColor: _amber,
                  ),
                ),
              ),
            ),
          ).animate().fadeIn(delay: 700.ms, duration: 500.ms),

<<<<<<< HEAD
          // Looping progress bar
=======
          // Loading bar — now actually animated, sweeping left to right on a loop
>>>>>>> d93c2721c193dc5d98f04dd5b6ac02b793cd4441
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
<<<<<<< HEAD
                    color: Colors.white.withOpacity(0.2),
=======
                    color: Colors.white.withOpacity(0.15),
>>>>>>> d93c2721c193dc5d98f04dd5b6ac02b793cd4441
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
<<<<<<< HEAD
                      TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 12),
=======
                      TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 12),
>>>>>>> d93c2721c193dc5d98f04dd5b6ac02b793cd4441
                ),
              ],
>>>>>>> 858f468a4725940b8a5dad9c9ae2b3a432491c16
            ),
          ),
        ],
      ),
    );
  }
}