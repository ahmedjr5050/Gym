import 'package:fitflow/core/services/getit_services.dart';
import 'package:fitflow/features/profile/domain/repo/fitness_data_repository.dart';
import 'package:fitflow/features/profile/presention/view/get_bmi_cubit/getbmi_cubit.dart';
import 'package:fitflow/features/profile/presention/view/get_bmi_cubit/getbmi_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileSetupView extends StatelessWidget {
  static const routeName = '/profile_setup_view';

  final String? gender;
  final String? hypertension;
  final String? diabetic;
  final int? age;
  final String? weight;
  final double? height;

  const ProfileSetupView({
    super.key,
    this.gender,
    this.hypertension,
    this.diabetic,
    this.age,
    this.weight,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FitnessDataCubit(
        getIt<FitnessDataRepository>(),
      ),
      child: BlocListener<FitnessDataCubit, FitnessDataState>(
        listener: (context, state) {
          if (state is FitnessDataError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: BlocBuilder<FitnessDataCubit, FitnessDataState>(
          builder: (context, state) {
            final cubit = context.read<FitnessDataCubit>();

            if (state is FitnessDataInitial) {
              // Automatically trigger the cubit to load data when the page is built
              WidgetsBinding.instance.addPostFrameCallback((_) {
                cubit.loadFitnessData(
                  gender: gender ?? 'male',
                  age: age ?? 25,
                  height: height ?? 1.50,
                  weight: weight ?? '50',
                  diabetic: diabetic ?? 'no',
                  hypertension: hypertension ?? 'no',
                );
              });
            }

            return Scaffold(
              appBar: AppBar(title: const Text("Profile Setup")),
              body: Center(
                child: state is FitnessDataLoading
                    ? const CircularProgressIndicator()
                    : state is FitnessDataLoaded
                        ? Text('Fitness Data Loaded: ${state.fitnessData.bmi}')
                        : Text(
                            'Gender: ${gender}',
                          ),
              ),
            );
          },
        ),
      ),
    );
  }
}
