import 'dart:math';
import 'package:flutter/material.dart';

class SecondAnimation extends StatefulWidget {
  const SecondAnimation({super.key});

  @override
  State<SecondAnimation> createState() => _SecondAnimationState();
}

class _SecondAnimationState extends State<SecondAnimation> {
  bool visiable = true;
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation'),
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black12,
          ),
          const Center(
            child: Text(
              'My Text',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          AnimatedPositioned(
            
            bottom: visiable? 280.0 : 380.0,
            right: 90.0,
            duration: const Duration(seconds: 2),
            child: AnimatedContainer(
              curve: Curves.bounceOut,
              duration: const Duration(seconds: 2),
              width:  visiable? 200 : 0,
              height: 100,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.circular(15.0)

              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {

            Random random = Random();

            visiable = !visiable;

            _color = Color.fromRGBO(random.nextInt(256), random.nextInt(256), random.nextInt(256),  1);



          });
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
