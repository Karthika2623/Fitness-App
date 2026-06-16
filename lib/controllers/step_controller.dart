import 'package:fitness_app/services/pedometer_service.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';


class StepController extends GetxController {

  final PedometerService pedometerService =
  PedometerService();

  RxInt steps = 0.obs;



  @override
  void onInit() async {
    super.onInit();

    await Permission.activityRecognition.request();

    pedometerService.stepStream.listen(
          (event) {
        print("LIVE STEP => ${event.steps}");
        steps.value = event.steps;
      },
      onError: (e) {
        print("ERROR => $e");
      },
    );
  }
}