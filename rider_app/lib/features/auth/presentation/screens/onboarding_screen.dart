// rider_app/lib/features/auth/presentation/screens/onboarding_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'register_screen.dart';
// 👈 Update this import to wherever FallbackImage actually lives in your project
import '../../../../shared/widgets/fallback_image.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

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
    ),
  ];

  bool get _isLastPage => _currentPage == _items.length - 1;

  @override
  Widget build(BuildContext context) {
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
                  ],
                ),
              ),
            ),
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
            ),
          ),
        ],
      ),
    );
  }

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
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [_amber.withOpacity(0.3), _amber.withOpacity(0.0)],
        ),
      ),
    );
  }

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
      curve: Curves.easeInOut,
    );
  }

<<<<<<< HEAD
  void _previousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

=======
>>>>>>> d93c2721c193dc5d98f04dd5b6ac02b793cd4441
  void _goToRegister() {
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const RegisterScreen()),
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class OnboardingItem {
  final String title;
  final String description;
  final String imagePath;

  const OnboardingItem({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}