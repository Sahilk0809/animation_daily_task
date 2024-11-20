import 'package:animation_daily_task/view/home_page.dart';
import 'package:animation_daily_task/view/greeting_animation.dart';
import 'package:animation_daily_task/view/plane_animation.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PlaneAnimationPage(),
    );
  }
}
