import 'package:flutter/material.dart';

class MyFadeTransition extends StatefulWidget {
  final Widget child;

  const MyFadeTransition({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<MyFadeTransition> createState() => _MyFadeTransitionState();
}

class _MyFadeTransitionState extends State<MyFadeTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  // late Animation<double> _animation;
  late final Animation<AlignmentGeometry> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),

    );
    // _animation = Tween(
    //   begin: 0.0,
    //   end: 1.0,
    // ).animate(_controller);

    _animation = Tween<AlignmentGeometry>(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.decelerate,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // _controller.forward();
    return AlignTransition(
      alignment: _animation,
      child:  widget.child,
    );
    // return Transition(
    //   opacity: _animation,
    //   child: widget.child,
    // );
  }
}
