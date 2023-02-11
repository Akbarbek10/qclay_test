import 'package:flutter/material.dart';

class MyVerticalTransition extends StatefulWidget {
  final num startingPoint;
  final Widget child;
  final AnimationController controller;

  const MyVerticalTransition({
    Key? key,
    required this.startingPoint,
    required this.child,
    required this.controller,
  }) : super(key: key);

  @override
  State<MyVerticalTransition> createState() => _MyVerticalTransitionState();
}

class _MyVerticalTransitionState extends State<MyVerticalTransition>
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
          offset: Offset(0, (widget.startingPoint * position * (1 - _animation.value).toDouble())),
          child: Opacity(
            opacity: _animation.value,
            child: child,
          ),
        );
      },
    );

  }
}
