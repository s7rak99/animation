import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Center(
        child: ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                  PageTransition(child: SecondScreen(), type: PageTransitionType.rotate ,duration: Duration(seconds: 2), alignment: Alignment.center));
            },
            icon: const Icon(Icons.arrow_forward_ios),
            label: const Text('Go To Second Page')),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        title: const Text('SecondScreen Screen'),
      ),
    );
  }
}
