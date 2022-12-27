import 'dart:math';
import 'package:flutter/material.dart';

class FirstTransition extends StatefulWidget {
  const FirstTransition({super.key});

  @override
  State<FirstTransition> createState() => _FirstTransitionState();
}

class _FirstTransitionState extends State<FirstTransition>
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
    )..repeat(
      reverse: true,
      period: Duration(seconds: 5)
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
        child: RotationTransition(
          turns: _animation!,
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

//RotationTransition
