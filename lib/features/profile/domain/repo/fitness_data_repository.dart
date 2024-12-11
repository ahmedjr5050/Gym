import 'package:fitflow/features/profile/domain/models/entities.dart';

abstract class FitnessDataRepository {
  Future<FitnessData> fetchFitnessData({
    required String gender,
    required int age,
    required double height,
    required String weight,
     required String diabetic,
    required String hypertension,
   
  });
}
