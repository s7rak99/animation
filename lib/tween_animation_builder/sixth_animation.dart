import 'dart:math';
import 'package:flutter/material.dart';

class SixthAnimation extends StatefulWidget {
  const SixthAnimation({super.key});

  @override
  State<SixthAnimation> createState() => _SixthAnimationState();
}

class _SixthAnimationState extends State<SixthAnimation> {
  double _angle = 0.0;
  double _value = 0.0;

  bool swap = false;
  double targetValue = 24.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: _angle),
                duration: const Duration(seconds: 1),
                builder: (BuildContext context, double angle, Widget? child){
                  return Transform.rotate(
                    angle: angle,
                    child:child
                  );
                },
              child: Container(
                height: 200.0,
                width: 300.0,
                color: Colors.green,
              ),
            ),

            Text(
              '${(_value * (180 / pi)).round()}',
              style: const TextStyle(
                fontSize: 30.0,
              ),
            ),
            Slider(
              value: _value,
              min: 0,
              max: pi*2,
              divisions: 4,
              onChanged: (val) {
                setState(() {
                  _value = val;
                  _angle = val;
                });
              },
            ),

          ],
        ),
      ),

    );
  }
}
