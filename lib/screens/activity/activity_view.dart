import 'package:fitness_app/widgets/step_circle.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/activity_controller.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ActivityController());

    return Scaffold(
      appBar: AppBar(title: const Text("Activity")),

      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [
              StepCircle(steps: controller.steps.value),

              const SizedBox(height: 30),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),

                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: Column(
                        children: [
                          const Text("Calories"),

                          Text(controller.calories.value.toStringAsFixed(0)),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),

                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: Column(
                        children: [
                          const Text("Distance"),

                          Text(controller.distance.value.toStringAsFixed(2)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 250,
                child: LineChart(
                  LineChartData(
                    minX: 0,
                    maxX: 6,
                    minY: 0,
                    maxY: 10,
                    lineBarsData: [
                      LineChartBarData(
                        spots: const [
                          FlSpot(0, 2),
                          FlSpot(1, 4),
                          FlSpot(2, 3),
                          FlSpot(3, 7),
                          FlSpot(4, 5),
                          FlSpot(5, 8),
                          FlSpot(6, 6),
                        ],
                        isCurved: true,
                        color: Color(0xff7B2FF7),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
