import 'package:fitness_app/controllers/step_controller.dart';
import 'package:get/get.dart';
import 'package:health/health.dart';
import '../repository/step_repository.dart';
import '../services/health_service.dart';
import '../services/firestore_service.dart';

class DashboardController extends GetxController {

  late StepRepository repository;

  final HealthService service = HealthService();

  RxInt steps = 0.obs;
  RxDouble calories = 0.0.obs;
  RxDouble distance = 0.0.obs;
  RxInt water = 0.obs;

  @override
  void onInit() {
    super.onInit();

    repository = Get.find<StepRepository>();

    loadHealthData();

    Get.find<StepController>().steps.listen((value) {
      steps.value = value;
    });
  }

  Future<void> loadHealthData() async {

    await service.requestAccess();

    steps.value = await service.getSteps();

    calories.value = await service.getCalories();

    distance.value = await service.getDistance();

    await repository.saveSteps(steps.value);

    await FirestoreService().backupSteps(steps.value);
  }
}