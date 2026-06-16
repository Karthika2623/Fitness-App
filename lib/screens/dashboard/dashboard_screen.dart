import 'package:fitness_app/app/routes.dart';
import 'package:fitness_app/controllers/auth_controller.dart';
import 'package:fitness_app/controllers/dashboard_controller.dart';
import 'package:fitness_app/widgets/stat_carf.dart';
import 'package:fitness_app/widgets/workout_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardView extends GetView<DashboardController> {
   DashboardView({super.key});
  final DashboardController controller =
  Get.put(DashboardController());
   final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [


                const SizedBox(height: 20),

                Obx(() => Text(
                  "Hi ${authController.userName.value}",
                  style: const TextStyle(fontSize:17,color: Colors.black38),
                )),

                const Text(
                  "Get In Shape",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),
                const WorkoutCard(),

                const SizedBox(height: 25),

                const Text(
                  "Today's Activity",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 15),

                Obx(
                  () => GridView.count(
                    shrinkWrap: true,

                    physics: NeverScrollableScrollPhysics(),

                    crossAxisCount: 2,

                    crossAxisSpacing: 12,

                    mainAxisSpacing: 12,

                    childAspectRatio: 1.3,

                    children: [
                      StatCard(
                        title: "Steps",
                        value: controller.steps.value.toString(),
                        icon: Icons.directions_walk,
                      ),

                      StatCard(
                        title: "Calories",
                        value: controller.calories.value.toString(),
                        icon: Icons.local_fire_department,
                      ),

                      StatCard(
                        title: "Distance",
                        value: "${controller.distance.value} km",
                        icon: Icons.location_on,
                      ),

                      StatCard(
                        title: "Water",
                        value: "${controller.water.value} L",
                        icon: Icons.water_drop,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),

                ElevatedButton.icon(

                  onPressed: () {

                    Get.toNamed(
                      Routes.history,
                    );
                  },

                  icon: const Icon(
                    Icons.history,
                  ),

                  label: const Text(
                    "View History",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
