import 'package:fitness_app/repository/step_repository.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../controllers/dashboard_controller.dart';
import '../controllers/step_controller.dart';
import '../controllers/food_controller.dart';
import '../database/steps_table.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {

    Get.put(
      AppDatabase(),
      permanent: true,
    );

    Get.put(
      StepRepository(
        Get.find<AppDatabase>(),
      ),
      permanent: true,
    );
    Get.put(
      StepController(),
      permanent: true,
    );
    Get.put(
      AuthController(),
      permanent: true,
    );

    Get.put(
      FoodController(),
      permanent: true,
    );

    Get.put(
      DashboardController(),
      permanent: true,
    );
  }
}