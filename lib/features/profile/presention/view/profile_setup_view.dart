import 'package:fitflow/core/services/getit_services.dart';
import 'package:fitflow/features/profile/domain/repo/fitness_data_repository.dart';
import 'package:fitflow/features/profile/presention/view/get_bmi_cubit/getbmi_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileSetupView extends StatelessWidget {
  static const routeName = '/profile_setup_view';

  final String? gender;
  final String? hypertension;
  final String? diabetic;
  final int? age;
  final String? weight;
  final String? height;

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
    // Use the arguments to build the UI
    return BlocProvider(
      create: (context) => FitnessDataCubit(
        getIt<FitnessDataRepository>(),
      ),
      child: BlocBuilder<SubjectBloc, SubjectState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text("Profile Setup")),
            body: Center(
              child: Text(
                'Gender: ${gender}',
              ),
            ),
          );
        },
      ),
    );
  }
}
