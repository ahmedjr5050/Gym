import 'package:fitflow/features/profile/domain/models/entities.dart';

class FitnessDataModel {
  final double bmi;
  final String predictedLevel;
  final String predictedGoal;
  final String predictedType;
  final int predictedDiet;
  final int predictedExercise;

  FitnessDataModel({
    required this.bmi,
    required this.predictedLevel,
    required this.predictedGoal,
    required this.predictedType,
    required this.predictedDiet,
    required this.predictedExercise,
  });

  // تحويل JSON إلى Model
  factory FitnessDataModel.fromJson(Map<String, dynamic> json) {
    return FitnessDataModel(
      bmi: (json['BMI'] as num).toDouble(),
      predictedLevel: json['Predicted Level'] as String,
      predictedGoal: json['Predicted Goal'] as String,
      predictedType: json['Predicted Type'] as String,
      predictedDiet: json['Predicted Diet'] as int,
      predictedExercise: json['Predicted Exercise'] as int,
    );
  }

  // تحويل Model إلى Entity
  FitnessData toEntity() {
    return FitnessData(
      bmi: bmi,
      predictedLevel: predictedLevel,
      predictedGoal: predictedGoal,
      predictedType: predictedType,
      predictedDiet: predictedDiet,
      predictedExercise: predictedExercise,
    );
  }
}
