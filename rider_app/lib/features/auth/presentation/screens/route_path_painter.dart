// rider_app/lib/features/auth/presentation/screens/route_path_painter.dart
import 'package:flutter/material.dart';

/// Animated dashed route line with a moving "pin" marker travelling along it.
/// Used on the splash screen to suggest a ride/trip in progress.
class RoutePathPainter extends CustomPainter {
  final double progress; // 0.0 -> 1.0, loops
  final Color lineColor;
  final Color pinColor;

  RoutePathPainter({
    required this.progress,
    required this.lineColor,
    required this.pinColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final midY = size.height / 2;

    // Dashed base line
    final linePaint = Paint()
      ..color = lineColor
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    const dashWidth = 6.0;
    const dashSpace = 5.0;
    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, midY),
        Offset((startX + dashWidth).clamp(0, size.width), midY),
        linePaint,
      );
      startX += dashWidth + dashSpace;
    }

    // Start dot
    final dotPaint = Paint()..color = lineColor;
    canvas.drawCircle(Offset(0, midY), 4, dotPaint);

    // End dot (destination)
    canvas.drawCircle(Offset(size.width, midY), 4, dotPaint);

    // Moving pin / glow marker
    final travelX = size.width * progress;
    final pinGlowPaint = Paint()
      ..color = pinColor.withOpacity(0.35)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
    canvas.drawCircle(Offset(travelX, midY), 10, pinGlowPaint);

    final pinPaint = Paint()..color = pinColor;
    canvas.drawCircle(Offset(travelX, midY), 5, pinPaint);

    final pinCorePaint = Paint()..color = Colors.white;
    canvas.drawCircle(Offset(travelX, midY), 2, pinCorePaint);
  }

  @override
  bool shouldRepaint(covariant RoutePathPainter oldDelegate) =>
      oldDelegate.progress != progress ||
      oldDelegate.lineColor != lineColor ||
      oldDelegate.pinColor != pinColor;
}