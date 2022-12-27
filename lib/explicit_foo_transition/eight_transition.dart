import 'dart:math';
import 'package:flutter/material.dart';

class EightTransition extends StatefulWidget {
  const EightTransition({super.key});

  @override
  State<EightTransition> createState() => _EightTransitionState();
}

class _EightTransitionState extends State<EightTransition>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  late Animation<TextStyle> _animation;

  
  final DecorationTween decorationTween = DecorationTween(
    begin: BoxDecoration(
      color: Colors.black38,
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.zero,
      boxShadow: const [
        BoxShadow(
          color: Colors.white
        )
      ]
      
    ),
      end: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.zero,
          boxShadow: const [
            BoxShadow(
                color: Colors.black,
            )
          ]

      )
  );
  
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
    _animation =TextStyleTween(
      begin:  TextStyle(color: Colors.red, fontSize: 70),
      end:  TextStyle(color: Colors.yellow, fontSize: 50),
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
      backgroundColor: Colors.black,
      body: Center(
        child: DefaultTextStyleTransition(
          style: _animation,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: const Text('sahar')
          ),
        ),
      ),
    );
  }
}

