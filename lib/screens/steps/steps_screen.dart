import 'package:fitness_app/services/health_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/step_controller.dart';

class StepsScreen extends StatelessWidget {
  StepsScreen({super.key});

  final StepController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Steps")),

      body: Center(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Container(
                width: 220,
                height: 220,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.indigo, width: 10),
                ),

                child: Center(
                  child: Text(
                    controller.steps.value.toString(),

                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Text("Goal : ${controller.goal.value}"),
              //
              // Text("Distance : ${controller.distance.value} km"),
              //
              // Text("Calories : ${controller.calories.value}"),

              const SizedBox(height: 25),

              ElevatedButton(
                onPressed: () async {
                  final service = HealthService();

                  final steps = await service.getSteps();
                  final calories = await service.getCalories();
                  final distance = await service.getDistance();

                  final controller = Get.find<StepController>();

                  controller.steps.value = steps;
                  // controller.calories.value = calories;
                  // controller.distance.value = distance;
                },
                child: const Text("Sync Health Connect"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
