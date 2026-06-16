import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class StepCircle extends StatelessWidget {
  final int steps;

  const StepCircle({super.key, required this.steps});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 120,

      lineWidth: 12,

      percent: (steps / 15000).clamp(0.0, 1.0),

      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          const Icon(Icons.directions_walk, size: 40),

          Text(
            "$steps",
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),

          const Text("Steps"),
        ],
      ),

      progressColor: const Color(0xffFF6B35),

      backgroundColor: Colors.grey.shade300,

      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}
