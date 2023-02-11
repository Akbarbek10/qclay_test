import 'package:flutter/material.dart';

class MyHorizontalTransition extends StatefulWidget {
  final num startingPoint;
  final AnimationController controller;
  final Widget child;

  const MyHorizontalTransition({
    Key? key,
    required this.startingPoint,
    required this.child,
    required this.controller,
  }) : super(key: key);

  @override
  State<MyHorizontalTransition> createState() => _MyHorizontalTransitionState();
}

class _MyHorizontalTransitionState extends State<MyHorizontalTransition>
    with SingleTickerProviderStateMixin {
  double position = 1;
  late final Animation _animation;

  @override
  void initState() {
    _animation = CurvedAnimation(
      parent: widget.controller,
      curve: Curves.easeInOut,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      child: widget.child,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset((widget.startingPoint * position * (1 - _animation.value).toDouble()),0, ),
          child: Opacity(
            opacity: _animation.value,
            child: child,
          ),
        );
      },
    );

  }
}
