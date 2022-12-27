
import 'dart:math';

import 'package:flutter/material.dart';

class FirstAnimation extends StatefulWidget {
  const FirstAnimation({super.key});

  @override
  State<FirstAnimation> createState() => _FirstAnimationState();
}

class _FirstAnimationState extends State<FirstAnimation> {
  bool visiable = true;
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Animation'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {

              Random random = Random();

              visiable = !visiable;
              //double opacity = visiable? 1 :0;


              //random.nextInt(100);

              //random.nextDouble() * 200
              _width = random.nextDouble() * 200;
              _height  =random.nextDouble() * 200;
              _color = Color.fromRGBO(random.nextInt(256), random.nextInt(256), random.nextInt(256), visiable? 0 : 1);
              _borderRadius =  BorderRadius.circular(random.nextInt(100).toDouble());

              // _width = _width == 50 ? 200 : 50;
              // _height  = _height == 50 ? 200 : 50;
              // _color = _color == Colors.green ? Colors.red : Colors.green;
              // _borderRadius = _borderRadius == BorderRadius.circular(8)
              //     ? BorderRadius.circular(30)
              //     : BorderRadius.circular(8);
            });
          },
          child: const Icon(Icons.flip),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                curve: Curves.bounceInOut,
                width: _width,
                height: _height,
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: _borderRadius,
                ), duration: const Duration(seconds: 2),
              ),
              AnimatedOpacity(
                opacity: visiable? 1 :0,
                duration: const Duration(seconds: 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [


                    Text('one'),
                    Text('two'),
                    Text('three'),

                  ],
                ),
              ),
            ],
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
