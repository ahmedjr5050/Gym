import 'dart:developer';

import 'package:fitflow/features/profile/domain/repo/fitness_data_repository.dart';
import 'package:fitflow/features/profile/presention/view/get_bmi_cubit/getbmi_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FitnessDataCubit extends Cubit<FitnessDataState> {
  final FitnessDataRepository repository;

  FitnessDataCubit(this.repository) : super(FitnessDataInitial());

  Future<void> loadFitnessData({
    required String gender,
    required int age,
    required double height,
    required int weight,
    required String hypertension,
    required String diabetic,
  }) async {
    emit(FitnessDataLoading());
    try {
      // Pass the profile data to the repository
      final fitnessData = await repository.fetchFitnessData(
        gender: gender,
        age: age,
        height: height,
        weight: weight,
        diabetic: diabetic,
        hypertension: hypertension,
      );
      emit(FitnessDataLoaded(fitnessData));
    } catch (e) {
      emit(FitnessDataError('Failed to load fitness data: $e'));
      log(e.toString());
    }
  }
}
