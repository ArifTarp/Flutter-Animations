import 'package:animation/views/animations_view.dart';
import 'package:animation/views/loading_animation_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(AnimationApp());

class AnimationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Animation App',
        //home: AnimationsView()
        home: LoadingAnimationView()
        );
  }
}
