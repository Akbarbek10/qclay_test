import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class AddRemoveBtnCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.9976303);
    path.lineTo(0, 0);
    path.lineTo(size.width * 0.3178652, size.height * 0.1752128);
    path.cubicTo(
        size.width * 0.4345730,
        size.height * 0.2395441,
        size.width * 0.5780011,
        size.height * 0.2944043,
        size.width * 0.7411719,
        size.height * 0.3371232);
    path.cubicTo(
        size.width * 1.076096,
        size.height * 0.4248090,
        size.width * 1.074062,
        size.height * 0.6306682,
        size.width * 0.7374157,
        size.height * 0.7171706);
    path.lineTo(size.width * 0.6846079, size.height * 0.7307393);
    path.cubicTo(
        size.width * 0.5583292,
        size.height * 0.7631896,
        size.width * 0.4426236,
        size.height * 0.8024455,
        size.width * 0.3404157,
        size.height * 0.8475166);
    path.lineTo(0, size.height * 0.9976303);
    path.close();

    Paint paintFill = Paint()..style = PaintingStyle.fill;
    paintFill.shader = ui.Gradient.linear(
      Offset(size.width * 0.9293416, size.height * 0.5592417),
      Offset(size.width * 0.2375607, size.height * 0.5592417),
      [
        Colors.white,
         Color(0xFFF6F6F6),
      ],
      [0, 1],
    );
    canvas.drawPath(path, paintFill);
    canvas.drawPath(path, paintFill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
