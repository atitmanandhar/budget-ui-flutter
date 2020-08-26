import 'package:flutter/material.dart';
import 'dart:math';

class RadialPainter extends CustomPainter {
  RadialPainter({this.bgColor, this.lineColor, this.percent, this.width});

  final Color bgColor;
  final Color lineColor;
  final double percent;
  final double width;

  @override
  void paint(Canvas canvas, Size size) {
    Paint bgLine = Paint()
      ..color = bgColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Paint completeLine = Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, bgLine);

    double sweepAngle = 2 * pi * percent;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        sweepAngle, false, completeLine);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
