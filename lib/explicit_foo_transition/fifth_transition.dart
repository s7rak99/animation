import 'dart:math';
import 'package:flutter/material.dart';

class FifthTransition extends StatefulWidget {
  const FifthTransition({super.key});

  @override
  State<FifthTransition> createState() => _FifthTransitionState();
}

class _FifthTransitionState extends State<FifthTransition>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  late Animation<AlignmentGeometry> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
          seconds: 2
      ),
      upperBound: 1.0,
    )..repeat(
      reverse: true,
    );
    _animation =Tween<AlignmentGeometry>(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Center(
        child: AlignTransition(
          alignment: _animation,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: FlutterLogo(
              size: 300.0,
            ),
          ),
        ),
      ),
    );
  }
}

