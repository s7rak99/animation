import 'dart:math';
import 'package:flutter/material.dart';

class CustomAnimation extends StatefulWidget {
  const CustomAnimation({super.key});

  @override
  State<CustomAnimation> createState() => _CustomAnimationState();
}

class _CustomAnimationState extends State<CustomAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  Animation<Size>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..repeat(
        // reverse: true,
        );

    _animation = Tween<Size>(
      begin: const Size(150, 150),
      end: const Size(250, 250),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceIn));

    // _controller.addListener(() {
    //   setState(() {});
    // });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  var height = 150.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget? child) {
              return FlutterLogo(
                size: _animation!.value.height,
              );
            },
          ),
          ListTile(
            trailing: const Icon(Icons.arrow_forward),
            title: const Text('Forward'),
            tileColor: Colors.green,
            onTap: () => setState(() {
              //height = 250.0;
              _controller.forward();
            }),
          ),
          ListTile(
            leading: const Icon(Icons.arrow_back),
            title: const Text('Back'),
            tileColor: Colors.red,
            onTap: () => setState(() {
              //height = 150.0;
              _controller.reverse();
            }),
          )
        ],
      ),
    );
  }
}

//RotationTransition
