import 'dart:math';
import 'package:flutter/material.dart';

class SixthTransition extends StatefulWidget {
  const SixthTransition({super.key});

  @override
  State<SixthTransition> createState() => _SixthTransitionState();
}

class _SixthTransitionState extends State<SixthTransition>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  late Animation<Offset> _animation;

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
    _animation =Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(1, 1),
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
        child: SlideTransition(
          position: _animation,
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

