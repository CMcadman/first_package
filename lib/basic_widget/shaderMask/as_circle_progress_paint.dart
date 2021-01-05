import 'dart:math';

import 'package:flutter/material.dart';

class ASCircleProgressPaint extends CustomPainter {
  final double progress;

  ASCircleProgressPaint(this.progress);

  final _paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 20;

  @override
  void paint(Canvas canvas, Size size) {
    _paint.shader = SweepGradient(
      colors: [Colors.red, Colors.amber],
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawArc(
        Rect.fromLTWH(0, 0, size.width, size.height), 0, pi * 2, false, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
