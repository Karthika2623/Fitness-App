import 'package:pedometer/pedometer.dart';

class PedometerService {

  Stream<StepCount> get stepStream =>
      Pedometer.stepCountStream;
}