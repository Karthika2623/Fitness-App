import 'package:health/health.dart';

class HealthService {
  final Health health = Health();

  final types = [
    HealthDataType.STEPS,
    HealthDataType.DISTANCE_DELTA,
    HealthDataType.ACTIVE_ENERGY_BURNED,
  ];



  Future<int> getSteps() async {
    await requestAccess();

    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day);

    final steps = await health.getTotalStepsInInterval(
      midnight,
      now,
    );

    return steps ?? 0;
  }

  Future<double> getCalories() async {
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day);

    final data = await health.getHealthDataFromTypes(
      types: [HealthDataType.ACTIVE_ENERGY_BURNED],
      startTime: midnight,
      endTime: now,
    );

    double total = 0;

    for (var item in data) {
      total += (item.value as NumericHealthValue)
          .numericValue
          .toDouble();
    }

    return total;
  }

  Future<double> getDistance() async {
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day);

    final data = await health.getHealthDataFromTypes(
      types: [HealthDataType.DISTANCE_DELTA],
      startTime: midnight,
      endTime: now,
    );

    double total = 0;

    for (var item in data) {
      total += (item.value as NumericHealthValue)
          .numericValue
          .toDouble();
    }

    return total / 1000; // meters → km
  }
  Future<bool> requestAccess() async {
    return await health.requestAuthorization(
      types,
      permissions: List.filled(
        types.length,
        HealthDataAccess.READ,
      ),
    );
  }
}