import 'dart:math';
import 'package:flutter/material.dart';

class SecondTransition extends StatefulWidget {
  const SecondTransition({super.key});

  @override
  State<SecondTransition> createState() => _SecondTransitionState();
}

class _SecondTransitionState extends State<SecondTransition>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
          seconds: 2
      ),
      lowerBound: 0.5,
      upperBound: 1.0,
    )..repeat(
      reverse: true,
    );
    _animation = CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: ScaleTransition(
          scale: _animation!,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: FlutterLogo(
              size: 150.0,
            ),
          ),
        ),
      ),
    );
  }
}

