// rider_app/lib/features/auth/presentation/screens/onboarding_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'register_screen.dart';
<<<<<<< HEAD
import '../../../../core/constants/app_colors.dart';
=======
// 👈 Update this import to wherever FallbackImage actually lives in your project
import '../../../../shared/widgets/fallback_image.dart';
>>>>>>> 858f468a4725940b8a5dad9c9ae2b3a432491c16

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

<<<<<<< HEAD
  final List<_OnboardingItem> _items = const [
    _OnboardingItem(
      badge: 'VERIFIED DRIVERS',
      title: 'Safe & secure\nrides, always',
      description:
          'Every driver is background-checked and verified so you can relax and enjoy every journey.',
      imagePath: 'assets/images/onboarding_1.jpg',
      fallbackIcon: Icons.shield_rounded,
    ),
    _OnboardingItem(
      badge: 'REAL-TIME TRACKING',
      title: 'Fast, reliable\n& on-time',
      description:
          'Get matched with a driver in minutes. Track your ride live from pickup to destination.',
      imagePath: 'assets/images/onboarding_2.jpg',
      fallbackIcon: Icons.location_on_rounded,
    ),
    _OnboardingItem(
      badge: 'AFFORDABLE FARES',
      title: 'Great rides at\ngreat prices',
      description:
          'Transparent pricing with no surprises. Pay by cash or card — your choice, every time.',
      imagePath: 'assets/images/onboarding_3.jpg',
      fallbackIcon: Icons.payments_rounded,
=======
  static const _amber = Color(0xFFF59E0B);
  static const _amberDark = Color(0xFFD97706);
  static const _navy = Color(0xFF0B1A33);
  static const _navyPanel = Color(0xFF112341);

  final List<OnboardingItem> _items = [
    const OnboardingItem(
      title: 'Safe & secure rides',
      description:
          'Every driver is verified and background-checked, so you can relax and enjoy the ride.',
      imagePath: 'assets/images/onboarding_1.jpg',
    ),
    const OnboardingItem(
      title: 'Fast & reliable',
      description:
          'Get matched in minutes, with real-time tracking all the way to your destination.',
      imagePath: 'assets/images/onboarding_2.jpg',
>>>>>>> 858f468a4725940b8a5dad9c9ae2b3a432491c16
    ),
  ];

  bool get _isLastPage => _currentPage == _items.length - 1;

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Scaffold(
      backgroundColor: AppColors.deepBlue,
      body: Container(
        color: AppColors.deepBlue,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // ─── TRANSPARENT IMAGE OVERLAY ──────────────────────────
            Positioned.fill(
              child: Opacity(
                opacity: 0.25,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (i) => setState(() => _currentPage = i),
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      _items[index].imagePath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          decoration: BoxDecoration(
                            gradient: AppColors.blueGradient,
                          ),
                          child: Center(
                            child: Icon(
                              _items[index].fallbackIcon,
                              color: AppColors.brightGold.withOpacity(0.3),
                              size: 80,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),

            // ─── CIRCUIT GRID PATTERN ──────────────────────────────
            CustomPaint(painter: _OnboardingGridPainter()),

            // ─── GLOW EFFECTS ──────────────────────────────────────
            Positioned(
              top: -80,
              right: -80,
              child: _radialGlow(250, AppColors.brightGold, 0.08),
            ),
            Positioned(
              bottom: 40,
              left: -60,
              child: _radialGlow(200, AppColors.goldenOrange, 0.08),
            ),

            // ─── TOP BAR ─────────────────────────────────────────────
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(22, 14, 22, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _pill('${_currentPage + 1} / ${_items.length}'),
                      if (!_isLastPage)
                        GestureDetector(
                          onTap: _goToRegister,
                          child: _pill('Skip'),
                        )
                      else
                        const SizedBox(width: 1),
                    ],
                  ),
                ),
              ),
            ),

            // ─── BOTTOM OVERLAY ──────────────────────────────────────
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.fromLTRB(28, 32, 28, 44),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Badge
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: _buildBadge(
                        _items[_currentPage].badge,
                        key: ValueKey(_currentPage),
                      ),
                    ),

                    const SizedBox(height: 14),

                    // Title
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 350),
                      transitionBuilder: (child, anim) => FadeTransition(
                        opacity: anim,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0, 0.15),
                            end: Offset.zero,
                          ).animate(anim),
                          child: child,
                        ),
                      ),
                      child: Text(
                        _items[_currentPage].title,
                        key: ValueKey('title_$_currentPage'),
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          height: 1.15,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Description
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      child: Text(
                        _items[_currentPage].description,
                        key: ValueKey('desc_$_currentPage'),
                        style: TextStyle(
                          fontSize: 14.5,
                          color: Colors.white.withOpacity(0.65),
                          height: 1.6,
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Dots + Next button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Page indicators
                        Row(
                          children: List.generate(
                            _items.length,
                            (i) => AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.only(right: 6),
                              width: _currentPage == i ? 24 : 7,
                              height: 7,
                              decoration: BoxDecoration(
                                color: _currentPage == i
                                    ? AppColors.brightGold
                                    : Colors.white.withOpacity(0.18),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: _currentPage == i
                                    ? [
                                        BoxShadow(
                                          color: AppColors.brightGold.withOpacity(0.5),
                                          blurRadius: 6,
                                        ),
                                      ]
                                    : null,
                              ),
                            ),
                          ),
                        ),

                        // Next / Get started button
                        GestureDetector(
                          onTap: _isLastPage ? _goToRegister : _nextPage,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: _isLastPage ? 160 : 56,
                            height: 56,
                            decoration: BoxDecoration(
                              gradient: AppColors.orangeGradient,
                              borderRadius: BorderRadius.circular(28),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.brightGold.withOpacity(0.45),
                                  blurRadius: 22,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: Center(
                              child: _isLastPage
                                  ? const Text(
                                      'Get started',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 15,
                                        letterSpacing: 0.3,
                                      ),
                                    )
                                  : Icon(
                                      Icons.arrow_forward_rounded,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
=======
    final size = MediaQuery.of(context).size;
    final imageHeight = size.height * 0.58;

    return Scaffold(
      backgroundColor: _navy,
      body: Stack(
        children: [
          Positioned.fill(child: Container(color: _navy)),

          // Amber glow peeking from behind the image card's rounded corners
          Positioned(top: imageHeight - 36, left: 28, child: _glow(70)),
          Positioned(top: imageHeight - 50, right: 10, child: _glow(90)),

          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemCount: _items.length,
            itemBuilder: (context, index) =>
                _buildPage(_items[index], imageHeight),
          ),

          // Top overlay — page counter and Skip, floating over the photo
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _pill(
                      child: Text(
                        '${_currentPage + 1} / ${_items.length}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    if (!_isLastPage)
                      GestureDetector(
                        onTap: _goToRegister,
                        child: _pill(
                          child: const Text(
                            'Skip',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                    else
                      const SizedBox(width: 1),
>>>>>>> 858f468a4725940b8a5dad9c9ae2b3a432491c16
                  ],
                ),
              ),
            ),
<<<<<<< HEAD
          ],
        ),
      ),
    );
  }

  Widget _buildBadge(String label, {Key? key}) {
    return Container(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.brightGold.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.brightGold.withOpacity(0.35),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.brightGold,
              boxShadow: [
                BoxShadow(color: AppColors.brightGold.withOpacity(0.6), blurRadius: 4),
              ],
            ),
          ),
          const SizedBox(width: 7),
          Text(
            label,
            style: TextStyle(
              color: AppColors.brightGold,
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.8,
=======
          ),

          // Bottom overlay — dot indicators and the circular action button
          Positioned(
            left: 28,
            right: 28,
            bottom: 36,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(
                    _items.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.only(right: 6),
                      width: _currentPage == index ? 22 : 7,
                      height: 7,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? _amber
                            : Colors.white.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
<<<<<<< HEAD
                Row(
                  children: [
                    if (_currentPage > 0) ...[
                      GestureDetector(
                        onTap: _previousPage,
                        child: Container(
                          width: 54,
                          height: 54,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.1),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.2),
                            ),
                          ),
                          child: const Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                    ],
                    GestureDetector(
                      onTap: _isLastPage ? _goToRegister : _nextPage,
                      child: Container(
                        width: 54,
                        height: 54,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient:
                              const LinearGradient(colors: [_amber, _amberDark]),
                          boxShadow: [
                            BoxShadow(
                              color: _amber.withOpacity(0.4),
                              blurRadius: 16,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Icon(
                          _isLastPage
                              ? Icons.check_rounded
                              : Icons.arrow_forward_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
=======
                GestureDetector(
                  onTap: _isLastPage ? _goToRegister : _nextPage,
                  child: Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(colors: [_amber, _amberDark]),
                      boxShadow: [
                        BoxShadow(
                          color: _amber.withOpacity(0.4),
                          blurRadius: 16,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Icon(
                      _isLastPage
                          ? Icons.check_rounded
                          : Icons.arrow_forward_rounded,
                      color: Colors.white,
                    ),
                  ),
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

<<<<<<< HEAD
  Widget _pill(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.deepBlue.withOpacity(0.55),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.08), width: 1),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _radialGlow(double size, Color color, double opacity) {
=======
  Widget _buildPage(OnboardingItem item, double imageHeight) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
          child: SizedBox(
            height: imageHeight,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                FallbackImage(assetPath: item.imagePath),
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        _navyPanel.withOpacity(0.0),
                        _navyPanel.withOpacity(0.9),
                      ],
                      stops: const [0.0, 0.7, 1.0],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            color: _navyPanel,
            // Bottom padding clears the floating dots/button overlay so
            // longer descriptions never run underneath them.
            padding: const EdgeInsets.fromLTRB(28, 28, 28, 110),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.15, end: 0),
                const SizedBox(height: 12),
                Text(
                  item.description,
                  style: TextStyle(
                    fontSize: 14.5,
                    color: Colors.white.withOpacity(0.65),
                    height: 1.5,
                  ),
                ).animate().fadeIn(delay: 100.ms, duration: 400.ms),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _glow(double size) {
>>>>>>> 858f468a4725940b8a5dad9c9ae2b3a432491c16
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
<<<<<<< HEAD
          colors: [
            color.withOpacity(opacity),
            color.withOpacity(0.0),
          ],
=======
          colors: [_amber.withOpacity(0.3), _amber.withOpacity(0.0)],
>>>>>>> 858f468a4725940b8a5dad9c9ae2b3a432491c16
        ),
      ),
    );
  }

<<<<<<< HEAD
  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 450),
=======
  Widget _pill({required Widget child}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.35),
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 400),
>>>>>>> 858f468a4725940b8a5dad9c9ae2b3a432491c16
      curve: Curves.easeInOut,
    );
  }

<<<<<<< HEAD
=======
<<<<<<< HEAD
  void _previousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

=======
>>>>>>> d93c2721c193dc5d98f04dd5b6ac02b793cd4441
>>>>>>> 858f468a4725940b8a5dad9c9ae2b3a432491c16
  void _goToRegister() {
    if (mounted) {
      Navigator.pushReplacement(
        context,
<<<<<<< HEAD
        MaterialPageRoute(builder: (_) => const RegisterScreen()),
=======
        MaterialPageRoute(builder: (context) => const RegisterScreen()),
>>>>>>> 858f468a4725940b8a5dad9c9ae2b3a432491c16
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

<<<<<<< HEAD
class _OnboardingItem {
  final String badge;
  final String title;
  final String description;
  final String imagePath;
  final IconData fallbackIcon;

  const _OnboardingItem({
    required this.badge,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.fallbackIcon,
  });
}

class _OnboardingGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.brightGold.withOpacity(0.04)
      ..strokeWidth = 1;
    const step = 28.0;
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
=======
class OnboardingItem {
  final String title;
  final String description;
  final String imagePath;

  const OnboardingItem({
    required this.title,
    required this.description,
    required this.imagePath,
  });
>>>>>>> 858f468a4725940b8a5dad9c9ae2b3a432491c16
}