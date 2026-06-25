// rider_app/lib/features/auth/presentation/screens/route_path_painter.dart
import 'package:flutter/material.dart';

<<<<<<< HEAD
/// Animated dashed route line with a moving "pin" marker travelling along it.
/// Used on the splash screen to suggest a ride/trip in progress.
class RoutePathPainter extends CustomPainter {
  final double progress; // 0.0 -> 1.0, loops
=======
/// A subtle dashed "route line" with a small pin travelling along it.
/// Used as a signature brand accent on the splash screen — a nod to
/// navigation/ride-hailing without being a literal map or icon.
class RoutePathPainter extends CustomPainter {
  final double progress; // 0.0 - 1.0, drives the pin's position
>>>>>>> 858f468a4725940b8a5dad9c9ae2b3a432491c16
  final Color lineColor;
  final Color pinColor;

  RoutePathPainter({
    required this.progress,
    required this.lineColor,
    required this.pinColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
<<<<<<< HEAD
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
=======
    final path = Path()
      ..moveTo(0, size.height * 0.5)
      ..quadraticBezierTo(
        size.width * 0.25,
        0,
        size.width * 0.5,
        size.height * 0.5,
      )
      ..quadraticBezierTo(
        size.width * 0.75,
        size.height,
        size.width,
        size.height * 0.5,
      );

    final dashPaint = Paint()
      ..color = lineColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final metrics = path.computeMetrics().toList();
    for (final metric in metrics) {
      double distance = 0;
      const dashWidth = 6.0;
      const dashGap = 6.0;

      while (distance < metric.length) {
        final next = distance + dashWidth;
        canvas.drawPath(
          metric.extractPath(distance, next.clamp(0, metric.length)),
          dashPaint,
        );
        distance = next + dashGap;
      }

      final pinPos = metric.getTangentForOffset(metric.length * progress);
      if (pinPos != null) {
        canvas.drawCircle(pinPos.position, 5, Paint()..color = pinColor);
        canvas.drawCircle(
          pinPos.position,
          9,
          Paint()
            ..color = pinColor.withOpacity(0.25)
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2,
        );
      }
    }
>>>>>>> 858f468a4725940b8a5dad9c9ae2b3a432491c16
  }

  @override
  bool shouldRepaint(covariant RoutePathPainter oldDelegate) =>
<<<<<<< HEAD
      oldDelegate.progress != progress ||
      oldDelegate.lineColor != lineColor ||
      oldDelegate.pinColor != pinColor;
=======
      oldDelegate.progress != progress;
>>>>>>> 858f468a4725940b8a5dad9c9ae2b3a432491c16
}