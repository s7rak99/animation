import 'dart:math';
import 'package:flutter/material.dart';

class FifthAnimation extends StatefulWidget {
  const FifthAnimation({super.key});

  @override
  State<FifthAnimation> createState() => _FifthAnimationState();
}

class _FifthAnimationState extends State<FifthAnimation> {
  double _fontSize = 30.0;
  Color _color = Colors.red;
  FontWeight _fontWeight = FontWeight.bold;

  bool swap = false ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation'),
      ),
      body: Center(
        child: AnimatedDefaultTextStyle(
          duration: Duration(seconds: 1),
          style: TextStyle(
            fontSize: _fontSize,
            fontWeight: _fontWeight,
            color: _color,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'my text',
              ),
              Text(
                'my text',
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            swap = !swap;

            Random random = Random();
            _fontSize = random.nextInt(60).toDouble() ;
            _color = Color.fromRGBO(random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);

            _fontWeight = swap ? FontWeight.w300 : FontWeight.bold;

          });
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
