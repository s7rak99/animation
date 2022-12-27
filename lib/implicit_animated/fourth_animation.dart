import 'dart:math';
import 'package:flutter/material.dart';

class FourthAnimation extends StatefulWidget {
  const FourthAnimation({super.key});

  @override
  State<FourthAnimation> createState() => _FourthAnimationState();
}

class _FourthAnimationState extends State<FourthAnimation> {

  double x = 0.0;
  double y = 0.0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation'),
      ),
      body: Center(
        child: Container(
          width: 300.0,
          height: 300.0,
          color: Colors.yellow[200],
          child:  AnimatedAlign(
            duration: const Duration(milliseconds: 500),
            alignment:FractionalOffset(x, y),
            child:const FlutterLogo(
              size: 60.0,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Random random = Random();
            x = x == 0 ? 1 : 0;
            y= y == 0 ? 1 : 0;
            //00 01 10 11
           // x = random.nextDouble();
           // y = random.nextDouble();
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
