import 'package:fitflow/features/profile/domain/models/entities.dart';


abstract class FitnessDataState {}

class FitnessDataInitial extends FitnessDataState {}

class FitnessDataLoading extends FitnessDataState {}

class FitnessDataLoaded extends FitnessDataState {
  final FitnessData fitnessData;

  FitnessDataLoaded(this.fitnessData);
}

class FitnessDataError extends FitnessDataState {
  final String message;

  FitnessDataError(this.message);
}
