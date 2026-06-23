// rider_app/lib/features/auth/presentation/screens/route_path_painter.dart
import 'package:flutter/material.dart';

/// A subtle dashed "route line" with a small pin travelling along it.
/// Used as a signature brand accent on the splash screen — a nod to
/// navigation/ride-hailing without being a literal map or icon.
class RoutePathPainter extends CustomPainter {
  final double progress; // 0.0 - 1.0, drives the pin's position
  final Color lineColor;
  final Color pinColor;

  RoutePathPainter({
    required this.progress,
    required this.lineColor,
    required this.pinColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
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
  }

  @override
  bool shouldRepaint(covariant RoutePathPainter oldDelegate) =>
      oldDelegate.progress != progress;
}