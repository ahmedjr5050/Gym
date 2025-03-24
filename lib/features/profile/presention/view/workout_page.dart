import 'package:fitflow/core/utils/app_images.dart';
import 'package:fitflow/features/profile/diet_workout.dart';
import 'package:fitflow/features/profile/domain/models/entities.dart';
import 'package:fitflow/features/profile/presention/view/schdual_workout_screen.dart';
import 'package:flutter/material.dart';

class WorkOutScreen extends StatelessWidget {
  const WorkOutScreen({super.key, required this.fitnessData});
  final FitnessData fitnessData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(children: [
          SizedBox(
            height: 89,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SchdualWorkoutScreen(
                    index: fitnessData.predictedDiet,
                  ),
                ),
              );
            },
            child: Container(
              width: 392,
              height: 200,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0xFF007AFF)),
                  borderRadius: BorderRadius.circular(10),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 181,
                    top: 83,
                    child: Text(
                      'Workout',
                      style: TextStyle(
                        color: Color(0xFF007AFF),
                        fontSize: 26,
                        fontFamily: 'Roboto Slab',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 11,
                    top: 7,
                    child: Container(
                      width: 161,
                      height: 176,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: AssetImage(Assets.imagesWorkoutimage1),
                          fit: BoxFit.fill,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 69,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DietWorkout(
                    index: fitnessData.predictedDiet,
                  ),
                ),
              );
            },
            child: Container(
              width: 392,
              height: 200,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0xFF007AFF)),
                  borderRadius: BorderRadius.circular(10),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 181,
                    top: 83,
                    child: Text(
                      'Diet',
                      style: TextStyle(
                        color: Color(0xFF007AFF),
                        fontSize: 26,
                        fontFamily: 'Roboto Slab',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 11,
                    top: 7,
                    child: Container(
                      width: 161,
                      height: 176,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            Assets.imagesWorkoutimage2,
                          ),
                          fit: BoxFit.fill,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
