import 'package:get/get.dart';

class NavigationController extends GetxController {

  RxInt currentIndex = 0.obs;

  changeTab(int index) {
    currentIndex.value = index;
  }
}