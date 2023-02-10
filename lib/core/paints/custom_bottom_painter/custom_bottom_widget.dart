import 'package:flutter/material.dart';
import 'package:qclay_test/core/theme/colors/theme_colors.dart';

class BottomWidgetCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.4224603);
    path.cubicTo(0, size.height * 0.1891421, size.width * 0.05568201, 0,
        size.width * 0.1243692, 0);
    path.lineTo(size.width * 0.3442850, 0);
    path.cubicTo(
        size.width * 0.3552897,
        0,
        size.width * 0.3661706,
        size.height * 0.007948095,
        size.width * 0.3762033,
        size.height * 0.02331722);
    path.lineTo(size.width * 0.4007593, size.height * 0.06093571);
    path.cubicTo(
        size.width * 0.4138107,
        size.height * 0.08093016,
        size.width * 0.4279673,
        size.height * 0.09126984,
        size.width * 0.4422850,
        size.height * 0.09126984);
    path.cubicTo(
        size.width * 0.4860584,
        size.height * 0.09126984,
        size.width * 0.5172664,
        size.height * 0.09126984,
        size.width * 0.5621449,
        size.height * 0.09126984);
    path.cubicTo(
        size.width * 0.5727780,
        size.height * 0.09126984,
        size.width * 0.5833037,
        size.height * 0.08385000,
        size.width * 0.5930584,
        size.height * 0.06947127);
    path.lineTo(size.width * 0.6253995, size.height * 0.02179865);
    path.cubicTo(size.width * 0.6351542, size.height * 0.007419556,
        size.width * 0.6456729, 0, size.width * 0.6563061, 0);
    path.lineTo(size.width * 0.8756308, 0);
    path.cubicTo(size.width * 0.9443178, 0, size.width, size.height * 0.1891421,
        size.width, size.height * 0.4224603);
    path.lineTo(size.width, size.height);
    path.cubicTo(size.width, size.height, size.width * 0.9652383, size.height,
        size.width * 0.9223598, size.height);
    path.lineTo(size.width * 0.07764019, size.height);
    path.cubicTo(
        size.width * 0.03476075, size.height, 0, size.height, 0, size.height);
    path.lineTo(0, size.height * 0.4224603);
    path.close();

    Paint paintFill = Paint()..style = PaintingStyle.fill;
    paintFill.color = ThemeColors.primaryColor;
    canvas.drawPath(path, paintFill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
