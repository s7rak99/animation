import 'dart:math';
import 'package:flutter/material.dart';

class ForthTransition extends StatefulWidget {
  const ForthTransition({super.key});

  @override
  State<ForthTransition> createState() => _ForthTransitionState();
}

class _ForthTransitionState extends State<ForthTransition>
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
      backgroundColor: Colors.black38,
      body: Center(
        child: FadeTransition(
          opacity: _animation!,
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

