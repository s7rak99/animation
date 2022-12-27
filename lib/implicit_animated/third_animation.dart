import 'dart:math';
import 'package:flutter/material.dart';

class ThirdAnimation extends StatefulWidget {
  const ThirdAnimation({super.key});

  @override
  State<ThirdAnimation> createState() => _ThirdAnimationState();
}

class _ThirdAnimationState extends State<ThirdAnimation> {

  double padValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation'),
      ),
      body: Center(
        child: AnimatedPadding(
          duration: const Duration(seconds: 1),
          padding: EdgeInsets.symmetric(horizontal: padValue),
          child: Container(
            height: 200.0,
            color: Colors.blue,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {

            Random random = Random();

            padValue = padValue == 0.0 ?  random.nextInt(50).toDouble() : 0.0;

          });
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
