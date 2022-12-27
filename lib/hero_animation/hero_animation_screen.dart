import 'package:flutter/material.dart';

class HeroAnimationScreen extends StatefulWidget {
  const HeroAnimationScreen({Key? key}) : super(key: key);

  @override
  State<HeroAnimationScreen> createState() => _HeroAnimationScreenState();
}

class _HeroAnimationScreenState extends State<HeroAnimationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Animation'),
      ),
      body: Center(
        child: Builder(
          builder: (context) {
            return MaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => FlutterPage()));
                },
                child: const Hero(
                  tag: 'fo_flutter',
                  child: FlutterLogo(
                    size: 50,
                  ),
                ));
          },
        ),
      ),
    );
  }
}

class FlutterPage extends StatelessWidget {
  const FlutterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Page'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: const [
          SizedBox(
            width: double.infinity,
            height: 190,
            child: Center(
              child: Hero(
                tag: 'fo_flutter',
                child: Icon(Icons.photo_outlined,
                  size: 250.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

