// rider_app/lib/features/auth/presentation/screens/splash_screen.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'onboarding_screen.dart';
// To this:
import '../../../../core/constants/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _carAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
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
              ),
            ),
          ),

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
                ),
              ),
            ),
          ),

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
            ),
          ),
        ],
      ),
    );
  }
}