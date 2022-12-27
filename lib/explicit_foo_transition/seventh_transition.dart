import 'dart:math';
import 'package:flutter/material.dart';

class SeventhTransition extends StatefulWidget {
  const SeventhTransition({super.key});

  @override
  State<SeventhTransition> createState() => _SeventhTransitionState();
}

class _SeventhTransitionState extends State<SeventhTransition>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  late Animation<Decoration> _animation;

  
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
    _animation =DecorationTween(
      begin:  BoxDecoration(color: Colors.red),
      end:  BoxDecoration(color: Colors.blue),
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
      backgroundColor: Colors.grey,
      body: Center(
        child: DecoratedBoxTransition(
          decoration: decorationTween.animate(_controller),
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

