import 'package:flutter/material.dart';
import 'package:qclay_test/core/theme/colors/theme_colors.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.1243691,0);
    path_0.cubicTo(size.width*0.05568202,0,0,size.height*0.1054505,0,size.height*0.2355309);
    path_0.lineTo(0,size.height*0.7644681);
    path_0.cubicTo(0,size.height*0.8945479,size.width*0.05568202,size.height,size.width*0.1243691,size.height);
    path_0.lineTo(size.width*0.3442837,size.height);
    path_0.cubicTo(size.width*0.3552893,size.height,size.width*0.3661685,size.height*0.9955691,size.width*0.3762022,size.height*0.9870000);
    path_0.lineTo(size.width*0.4007584,size.height*0.9660266);
    path_0.cubicTo(size.width*0.4138118,size.height*0.9548777,size.width*0.4279663,size.height*0.9491170,size.width*0.4422837,size.height*0.9491170);
    path_0.lineTo(size.width*0.5621517,size.height*0.9491170);
    path_0.cubicTo(size.width*0.5727837,size.height*0.9491170,size.width*0.5833034,size.height*0.9532500,size.width*0.5930590,size.height*0.9612660);
    path_0.lineTo(size.width*0.6253989,size.height*0.9878457);
    path_0.cubicTo(size.width*0.6351545,size.height*0.9958617,size.width*0.6456742,size.height,size.width*0.6563062,size.height);
    path_0.lineTo(size.width*0.8756320,size.height);
    path_0.cubicTo(size.width*0.9443174,size.height,size.width,size.height*0.8945479,size.width,size.height*0.7644681);
    path_0.lineTo(size.width,size.height*0.2355309);
    path_0.cubicTo(size.width,size.height*0.1054511,size.width*0.9443174,0,size.width*0.8756320,0);
    path_0.lineTo(size.width*0.6563062,0);
    path_0.cubicTo(size.width*0.6456742,0,size.width*0.6351545,size.height*0.004136564,size.width*0.6253989,size.height*0.01215319);
    path_0.lineTo(size.width*0.5930590,size.height*0.03873176);
    path_0.cubicTo(size.width*0.5833034,size.height*0.04674840,size.width*0.5727837,size.height*0.05088495,size.width*0.5621517,size.height*0.05088495);
    path_0.lineTo(size.width*0.4422837,size.height*0.05088495);
    path_0.cubicTo(size.width*0.4279663,size.height*0.05088495,size.width*0.4138118,size.height*0.04512021,size.width*0.4007584,size.height*0.03397298);
    path_0.lineTo(size.width*0.3762022,size.height*0.01299989);
    path_0.cubicTo(size.width*0.3661685,size.height*0.004431250,size.width*0.3552893,0,size.width*0.3442837,0);
    path_0.lineTo(size.width*0.1243691,0);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = ThemeColors.secondaryColor;
    canvas.drawPath(path_0,paint_0_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}