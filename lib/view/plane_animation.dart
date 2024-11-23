import 'package:flutter/material.dart';

class PlaneAnimationPage extends StatefulWidget {
  const PlaneAnimationPage({super.key});

  @override
  State<PlaneAnimationPage> createState() => _PlaneAnimationPageState();
}

class _PlaneAnimationPageState extends State<PlaneAnimationPage> {
  int index = 0;

  final List align = [
    {
      'align': Alignment.bottomLeft,
      'color': Colors.white,
    },
    {
      'align': Alignment.topCenter,
      'color': Colors.tealAccent,
    },
    {
      'align': Alignment.bottomRight,
      'color': Colors.grey,
    },
    {
      'align': Alignment.bottomLeft,
      'color': Colors.white,
    }
  ];

  void _toggleAnimation() {
    setState(() {

      // Ensure the index wraps within the range of the list
      if (index == align.length - 1) {
        index = 1;
      } else {
        index++;
      }
      print(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        padding: const EdgeInsets.only(top: 20),
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOut,
        color: align[index]['color'],
        child: Stack(
          children: [
            // Animated Plane Position
            AnimatedAlign(
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
              alignment: align[index]['align'],
              child: const Icon(
                Icons.flight,
                size: 100,
                color: Colors.teal,
              ),
            ),
            // Button to Toggle Animation
            Positioned(
              bottom: 20,
              left: MediaQuery.of(context).size.width * 0.32,
              child: ElevatedButton(
                onPressed: _toggleAnimation,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 24.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text(
                  "Toggle Plane",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
