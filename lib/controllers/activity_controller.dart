import 'package:fitness_app/controllers/step_controller.dart';
import 'package:fitness_app/services/health_service.dart';
import 'package:get/get.dart';

class ActivityController extends GetxController {
  RxInt steps = 0.obs;

  RxDouble distance = 0.0.obs;

  RxDouble calories = 0.0.obs;

  final healthService = HealthService();
  @override
  void onInit() {
    super.onInit();

    final stepController = Get.find<StepController>();

    steps.value = stepController.steps.value;

    ever(stepController.steps, (int value) {

      steps.value = value;

      distance.value = value * 0.0008;

      calories.value = value * 0.04;
    });
  }
}
