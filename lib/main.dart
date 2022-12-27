
import 'package:animation/FadeInImage/fade_in_images.dart';
import 'package:animation/app_on_animation/example.dart';
import 'package:animation/explicit_foo_transition/eight_transition.dart';
import 'package:animation/explicit_foo_transition/fifth_transition.dart';
import 'package:animation/explicit_foo_transition/fourth_transition.dart';
import 'package:animation/explicit_foo_transition/seventh_transition.dart';
import 'package:animation/explicit_foo_transition/sixth_transition.dart';
import 'package:animation/hero_animation/hero_animation_screen.dart';
import 'package:animation/implicit_animated/fifth_animation.dart';
import 'package:animation/implicit_animated/fourth_animation.dart';
import 'package:animation/implicit_animated/second_animation.dart';
import 'package:animation/implicit_animated/third_animation.dart';
import 'package:animation/like_button/like_button.dart';
import 'package:animation/pages_animation/page_animation.dart';
import 'package:flutter/material.dart';

import 'custom_explicit_animation/animated_builder_vs_widget.dart';
import 'custom_explicit_animation/custom_animation.dart';
import 'explicit_foo_transition/first_transition.dart';
import 'explicit_foo_transition/second_transition.dart';
import 'explicit_foo_transition/third_transition.dart';
import 'implicit_animated/first_animation.dart';
import 'tween_animation_builder/sixth_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: const LikesButton(),
    );
  }
}
