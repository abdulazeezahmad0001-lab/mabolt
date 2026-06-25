import 'package:flutter/material.dart';

class FallbackImage extends StatelessWidget {
  final String assetPath;
  final Widget? child;

  const FallbackImage({
    super.key,
    required this.assetPath,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetPath,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1A1A2E), Color(0xFF16213E)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: child ?? Container(),
        );
      },
    );
  }
}