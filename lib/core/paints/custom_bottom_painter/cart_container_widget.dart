import 'package:flutter/material.dart';
import 'package:qclay_test/core/theme/colors/theme_colors.dart';

class CartContainerCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.06859536);
    path.cubicTo(0, size.height * 0.03071121, size.width * 0.05568201, 0,
        size.width * 0.1243692, 0);
    path.lineTo(size.width * 0.3442850, 0);
    path.cubicTo(
        size.width * 0.3552897,
        0,
        size.width * 0.3661706,
        size.height * 0.001290541,
        size.width * 0.3762033,
        size.height * 0.003786044);
    path.lineTo(size.width * 0.4007593, size.height * 0.009894201);
    path.cubicTo(
        size.width * 0.4138107,
        size.height * 0.01314072,
        size.width * 0.4279650,
        size.height * 0.01481959,
        size.width * 0.4422827,
        size.height * 0.01481959);
    path.lineTo(size.width * 0.5621519, size.height * 0.01481959);
    path.cubicTo(
        size.width * 0.5727850,
        size.height * 0.01481959,
        size.width * 0.5833037,
        size.height * 0.01361482,
        size.width * 0.5930584,
        size.height * 0.01128013);
    path.lineTo(size.width * 0.6253995, size.height * 0.003539472);
    path.cubicTo(size.width * 0.6351542, size.height * 0.001204722,
        size.width * 0.6456729, 0, size.width * 0.6563061, 0);
    path.lineTo(size.width * 0.8756308, 0);
    path.cubicTo(size.width * 0.9443178, 0, size.width,
        size.height * 0.03071121, size.width, size.height * 0.06859536);
    path.lineTo(size.width, size.height );
    path.cubicTo(size.width, size.height, size.width,
        size.height, size.width * 0.9223598, size.height);
    path.lineTo(size.width, size.height);
    path.cubicTo(size.width, size.height, 0,
        size.height, 0, size.height);
    path.lineTo(0, size.height);
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
