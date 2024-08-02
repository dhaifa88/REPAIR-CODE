// dashed_line.dart
import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  final double width;
  final Color color;

  DashedLine({required this.width, required this.color});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, 1),
      painter: DashedLinePainter(color),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  final Color color;

  DashedLinePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    const double dashWidth = 5.0;
    const double dashSpace = 3.0;
    double startX = 0.0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
