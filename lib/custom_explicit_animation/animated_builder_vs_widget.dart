import 'dart:math';
import 'package:flutter/material.dart';


class BuilderVsWidget2 extends StatefulWidget {
  const BuilderVsWidget2({super.key});

  @override
  State<BuilderVsWidget2> createState() => _BuilderVsWidgetState2();
}

class _BuilderVsWidgetState2 extends State<BuilderVsWidget2>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  Animation<Size>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),

    )..repeat();

    _animation = Tween<Size>(
      begin: const Size(150, 150),
      end: const Size(250, 250),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceIn));


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
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.pink[100],
      body: Center(
        child: Transform.scale(
          scale: 3,
          child: AnimatedBuilder(
            animation: _controller ,
            builder: (context , child){
              return  Transform.rotate(angle: _controller.value*2*pi, child: child,);
            },
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  width: 2,
                ),
              ),
              child: const Text(
                'Click Me!',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


















class BuilderVsWidget extends StatefulWidget {
  const BuilderVsWidget({super.key});

  @override
  State<BuilderVsWidget> createState() => _BuilderVsWidgetState();
}

class _BuilderVsWidgetState extends State<BuilderVsWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  Animation<Size>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),

    )..repeat();

    _animation = Tween<Size>(
      begin: const Size(150, 150),
      end: const Size(250, 250),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceIn));


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
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.pink[100],
      body: Center(
        child: Transform.scale(
          scale: 3,
          child: OutlineButtonTransition(
              width:CurvedAnimation(
            parent: _controller,
            curve: Curves.linear,
          )),
        ),
      ),
    );
  }
}

class OutlineButtonTransition extends AnimatedWidget {
 // const OutlineButtonTransition({super.key, required super.listenable});


  const OutlineButtonTransition({super.key, width}): super(listenable: width);
  Animation<double> get width => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          width: width.value*3,
        ),
      ),
      child: const Text(
        'Click Me!',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
