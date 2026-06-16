import 'package:get/get.dart';
import 'auth_controller.dart';

class ProfileController extends GetxController {

  final AuthController authController = Get.find<AuthController>();

  RxDouble weight = 50.0.obs;
  RxDouble height = 170.0.obs;
  RxInt age = 23.obs;

  String get name => authController.userName.value;
}