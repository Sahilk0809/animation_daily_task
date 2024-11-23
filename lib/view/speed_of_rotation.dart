import 'package:flutter/material.dart';

class SpeedOfRotation extends StatefulWidget {
  const SpeedOfRotation({super.key});

  @override
  State<SpeedOfRotation> createState() => _SpeedOfRotationState();
}

class _SpeedOfRotationState extends State<SpeedOfRotation>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  int duration = 1;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  void initialize() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: duration),
      lowerBound: 0,
      upperBound: 1,
    )..repeat();
  }

  void updateDuration(int change) {
    setState(() {
      duration = (duration + change)
          .clamp(1, 60); // Ensuring duration is between 1 and 60
      // animationController.dispose(); // Dispose the old controller
      initialize(); // Reinitialize the controller with the new duration
      print(duration);
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              return RotationTransition(
                turns: animationController,
                child: Image.asset('assets/img/moon.jpg'),
              );
            },
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 2,
            onPressed: () {
              updateDuration(-1); // Decrease duration
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            heroTag: 1,
            onPressed: () {
              updateDuration(1); // Increase duration
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
