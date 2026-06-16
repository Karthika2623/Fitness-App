import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),

        gradient: const LinearGradient(
          colors: [Color(0xffFF6B35), Color(0xffFF8E53)],
        ),
      ),

      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: const [
                Text(
                  "Shoulder Press",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 8),

                Text(
                  "10 Shoulder Workout",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),

          const Icon(Icons.fitness_center, color: Colors.white, size: 60),
        ],
      ),
    );
  }
}
