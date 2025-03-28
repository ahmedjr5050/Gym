import 'package:fitflow/features/profile/domain/models/entities.dart';

abstract class FitnessDataRepository {
  Future<FitnessData> fetchFitnessData({
    required String gender,
    required int age,
    required double height,
    required int weight,
    required String hypertension,
    required String diabetic,
  });
}
