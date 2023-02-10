import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qclay_test/core/utils/app_utils.dart';
import 'package:qclay_test/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:qclay_test/injector_container.dart';
import 'dart:math' as math;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<HomeBloc>(),
      child: const HomePageBody(),
    );
  }
}

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!mounted) return;
    // initData(context);
  }

  @override
  void dispose() {
    // onDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return BlocConsumer<HomeBloc, HomeState>(
      listener: (_, state) {},
      builder: (_, state) {
        return Scaffold(
          backgroundColor: Color(0xFFEFEFEF),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 88.w,
                height: 210.h,
                child: CustomPaint(
                  painter: RPSCustomPainterBtn(),
                  child: Center(
                      child: Icon(
                    Icons.add,
                    size: 47.w,
                  )),
                ),
              ),
              SizedBox(
                width: 88.w,
                height: 210.h,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(math.pi),
                  child: CustomPaint(
                    painter: RPSCustomPainterBtn(),
                    child: Center(
                        child: Icon(
                          Icons.remove,
                          size: 47.w,
                        )),
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                child: Transform.scale(
                  scale: 1.09,
                  child: CustomPaint(
                    size: Size(size.width, 120),
                    painter: RPSCustomPainter(),
                    // child: Text("TEXT"),
                  ),
                ),
              ),
              Container(
                margin: AppUtils.kPaddingAll6,
                alignment: Alignment.topCenter,
                width: size.width * 0.12,
                height: 4,
                decoration: const BoxDecoration(
                  color: Color(0xffC9C9C9),
                  borderRadius: AppUtils.kBorderRadius12,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color(0xff1A1A1A)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(size.width * 0.5, size.height);
    path0.lineTo(size.width * 0.04, size.height);
    path0.quadraticBezierTo(size.width * 0.04, size.height * 0.68,
        size.width * 0.04, size.height * 0.75);
    path0.cubicTo(size.width * 0.04, size.height * 0.17, size.width * 0.13,
        size.height * 0.09, size.width * 0.25, size.height * 0.08);
    path0.quadraticBezierTo(size.width * 0.24, size.height * 0.084,
        size.width * 0.3, size.height * 0.08);
    path0.quadraticBezierTo(size.width * 0.33, size.height * 0.08,
        size.width * 0.35, size.height * 0.084);
    path0.quadraticBezierTo(size.width * 0.38, size.height * 0.084,
        size.width * 0.4, size.height * 0.15);
    path0.quadraticBezierTo(size.width * 0.43, size.height * 0.25,
        size.width * 0.44, size.height * 0.25);
    path0.cubicTo(size.width * 0.47, size.height * 0.245, size.width * 0.53,
        size.height * 0.25, size.width * 0.55, size.height * 0.25);
    path0.cubicTo(
        size.width * 0.57,
        size.height * 0.25,
        size.width * 0.5771556,
        size.height * 0.2045000,
        size.width * 0.5911111,
        size.height * 0.1666667);
    path0.cubicTo(size.width * 0.6016444, size.height * 0.13, size.width * 0.62,
        size.height * 0.0845833, size.width * 0.64, size.height * 0.0833333);
    path0.quadraticBezierTo(size.width * 0.67, size.height * 0.083,
        size.width * 0.7, size.height * 0.083);
    path0.quadraticBezierTo(size.width * 0.74, size.height * 0.083,
        size.width * 0.75, size.height * 0.08);
    path0.cubicTo(size.width * 0.86, size.height * 0.0846667, size.width * 0.96,
        size.height * 0.16, size.width * 0.96, size.height * 0.75);
    path0.quadraticBezierTo(
        size.width * 0.96, size.height * 0.68, size.width * 0.96, size.height);
    path0.lineTo(size.width * 0.5, size.height);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class RPSCustomPainterBtn extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.9976303);
    path_0.lineTo(0, 0);
    path_0.lineTo(size.width * 0.3178652, size.height * 0.1752128);
    path_0.cubicTo(
        size.width * 0.4345730,
        size.height * 0.2395441,
        size.width * 0.5780011,
        size.height * 0.2944043,
        size.width * 0.7411719,
        size.height * 0.3371232);
    path_0.cubicTo(
        size.width * 1.076096,
        size.height * 0.4248090,
        size.width * 1.074062,
        size.height * 0.6306682,
        size.width * 0.7374157,
        size.height * 0.7171706);
    path_0.lineTo(size.width * 0.6846079, size.height * 0.7307393);
    path_0.cubicTo(
        size.width * 0.5583292,
        size.height * 0.7631896,
        size.width * 0.4426236,
        size.height * 0.8024455,
        size.width * 0.3404157,
        size.height * 0.8475166);
    path_0.lineTo(0, size.height * 0.9976303);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(
      Offset(size.width * 0.9293416, size.height * 0.5592417),
      Offset(size.width * 0.2375607, size.height * 0.5592417),
      [
        Colors.white,
        Color(0xFFF0F0F0),
      ],
      [0, 1],
    );
    canvas.drawPath(path_0, paint_0_fill);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
