import 'package:fitflow/core/utils/app_images.dart';

final List<Exercise> exercises = [
  Exercise(
    day: 'Day 1',
    exerciseName: 'Chest',
    isLocked: false,
    imagePath: [
      Assets.imagesChest,
      'assets/images/chest_2.jpg',
    ],
    reps: '3 X 10',
    muscleTargeted: 'Chest',
  ),
  Exercise(
    day: 'Day 2',
    exerciseName: 'Back',
    isLocked: false,
    imagePath: [
      Assets.imagesChest,
      Assets.imagesChest,
    ],
    reps: '4 X 12',
    muscleTargeted: 'Back',
  ),
  Exercise(
    day: 'Day 3',
    exerciseName: 'Legs',
    isLocked: true,
    imagePath:[
      Assets.imagesChest,

    ],
    reps: '4 X 15',
    muscleTargeted: 'Legs',
  ),
  Exercise(
    day: 'Day 4',
    exerciseName: 'Arms',
    isLocked: true,
    imagePath: [
      Assets.imagesChest,

    ],
    reps: '3 X 12',
    muscleTargeted: 'Arms',
  ),
  Exercise(
    day: 'Day 5',
    exerciseName: 'Shoulders',
    isLocked: true,
    imagePath: [
      Assets.imagesChest,

    ],
    reps: '3 X 10',
    muscleTargeted: 'Shoulders',
  ),
];

class Exercise {
  final String day;
  final String exerciseName;
  final bool isLocked;
  final List<String> imagePath;
  final String reps;
  final String muscleTargeted;

  Exercise({
    required this.day,
    required this.exerciseName,
    required this.isLocked,
    required this.imagePath,
    required this.reps,
    required this.muscleTargeted,
  });
}
