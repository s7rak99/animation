import 'dart:math';
import 'package:flutter/material.dart';

class ThirdTransition extends StatefulWidget {
  const ThirdTransition({super.key});

  @override
  State<ThirdTransition> createState() => _ThirdTransitionState();
}

class _ThirdTransitionState extends State<ThirdTransition>
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
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: SizeTransition(
          sizeFactor: _animation!,
         // axis: Axis.horizontal,
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

