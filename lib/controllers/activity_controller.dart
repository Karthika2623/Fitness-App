import 'package:fitness_app/controllers/step_controller.dart';
import 'package:fitness_app/services/health_service.dart';
import 'package:get/get.dart';


class ActivityController
    extends GetxController {

  RxInt steps = 0.obs;

  RxDouble distance = 0.0.obs;

  RxDouble calories = 0.0.obs;

  final healthService =
  HealthService();

  @override
  void onInit() {
    super.onInit();

    fetchSteps();

    ever(Get.find<StepController>().steps, (value) {
      steps.value = value;

      distance.value = value / 1500;

      calories.value = value * 0.04;
    });
  }
  fetchSteps() async {

    final total =
    await healthService.getSteps();

    steps.value = total;

    distance.value =
        total / 1500;

    calories.value =
        total * 0.04;

  }
}