import 'package:dio/dio.dart';
import 'package:fitflow/features/profile/domain/models/entities.dart';
import 'package:fitflow/features/profile/domain/repo/fitness_data_repository.dart';
import '../models/fitness_data_model.dart';

class FitnessDataRepositoryImpl implements FitnessDataRepository {
  final Dio dio;

  FitnessDataRepositoryImpl(this.dio);

  @override
  Future<FitnessData> fetchFitnessData({
    required String gender,
    required int age,
    required double height,
    required String weight,
    required String hypertension,
    required String diabetic,
  }) async {
    const url =
        'http://10.0.2.2:8000/predict/'; // worker
// http://192.168.1.23:8000/predict/
    try {
      // Constructing the request payload
      final requestData = {
        "sex": gender,
        "age": age,
        "height": height,
        "weight": weight,
        "diabetes": diabetic,
        "hypertension": hypertension,
      };

      // Sending the POST request with the data
      final response = await dio.post(url, data: requestData);

      if (response.statusCode == 200) {
        final jsonData = response.data;
        final fitnessDataModel = FitnessDataModel.fromJson(jsonData);
        return fitnessDataModel.toEntity();
      } else {
        throw Exception(
            'Failed to fetch fitness data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error occurred while fetching fitness data: $e');
    }
  }
}
