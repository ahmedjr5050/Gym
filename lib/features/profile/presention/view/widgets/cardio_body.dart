import 'dart:developer';

import 'package:fitflow/core/utils/app_images.dart';
import 'package:fitflow/core/utils/app_text_style.dart';
import 'package:fitflow/features/profile/domain/models/entities.dart';
import 'package:fitflow/features/profile/presention/view/widgets/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;

class CardioExercises extends StatelessWidget {
  const CardioExercises({super.key, required this.fitnessData});
  final FitnessData fitnessData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        imagePath: Assets.imagesFitFlowlogo,
        titleText: 'Tips and Tricks',
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: DataLoader().loadData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            Map<String, dynamic> data = snapshot.data!;
            log(fitnessData.predictedDiet.toString());

            // Access vegetables from the predicted diet
            var diet = data['diets'][fitnessData.predictedDiet.toString()]
                ['vegetables'];

            if (diet != null) {
              log(diet.toString());

              // Join the list items into a single string with commas
              String vegetables = diet.join(', ');

              return Column(
                children: [
                  containerData(fitnessData: fitnessData)
                  // Other UI elements here...
                ],
              );
            } else {
              return Center(child: Text('No vegetables listed.'));
            }
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class containerData extends StatelessWidget {
  const containerData({
    super.key,
    required this.fitnessData,
  });
  final FitnessData fitnessData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 331,
          height: 298,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.imagesChest),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(height: 15.h),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: SizedBox(
            width: 324,
            height: 19,
            child: Text(
              fitnessData.predictedDiet.toString(),
              style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Start with a proper warm-up.\nGradually increase the intensity of your workouts.\nFocus on breathing techniques.\nIncorporate interval training.\nCool down to avoid injury and maximize recovery.\n',
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 14,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}

class DataLoader {
  // Function to load data from the bundled JSON file
  Future<Map<String, dynamic>> loadData() async {
    // Load the JSON file from assets using rootBundle
    final jsonString =
        await rootBundle.rootBundle.loadString('assets/models/diet.json');
    //  log(jsonString);
    return jsonDecode(jsonString); // Decode the JSON data
  }
}
