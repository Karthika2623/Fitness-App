import 'package:get/get.dart';
import '../repository/step_repository.dart';
import '../database/steps_table.dart';

class HistoryController
    extends GetxController {

  final repo =
  Get.find<StepRepository>();

  RxList<StepsTableData>
  history =
      <StepsTableData>[].obs;

  @override
  void onInit() {

    super.onInit();

    loadHistory();
  }

  Future loadHistory() async {

    history.value =
    await repo.getLast7Days();
  }
}