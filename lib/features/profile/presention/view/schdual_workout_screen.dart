import 'package:fitflow/core/utils/app_images.dart';
import 'package:fitflow/core/utils/app_text_style.dart';
import 'package:fitflow/features/profile/presention/view/widgets/customappbar.dart';
import 'package:flutter/material.dart';
import 'dart:convert'; // لتحليل بيانات JSON
import 'package:flutter/services.dart'; // لتحميل الملف

class SchdualWorkoutScreen extends StatefulWidget {
  final int index;

  const SchdualWorkoutScreen({Key? key, required this.index}) : super(key: key);

  @override
  _SchdualWorkoutScreenState createState() => _SchdualWorkoutScreenState();
}

class _SchdualWorkoutScreenState extends State<SchdualWorkoutScreen> {
  Map<String, dynamic>? scheduleData;

  @override
  void initState() {
    super.initState();
    loadScheduleData();
  }

  // تحميل بيانات JSON
  Future<void> loadScheduleData() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/models/diet.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      setState(() {
        scheduleData = jsonData;
      });
    } catch (e) {
      print("Error loading JSON: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (scheduleData == null) {
      return Scaffold(
        appBar: AppBar(title: Text('الجدول الأسبوعي')),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // استخرج البيانات بناءً على الـ index
    final exercises = Map<String, dynamic>.from(
        scheduleData!['exercises'][widget.index.toString()]);
    final List<dynamic> cardio =
        scheduleData!['cardio'][widget.index.toString()];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        imagePath: Assets.imagesFitFlowlogo,
        titleText: 'الجدول الأسبوعي',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'التمارين الأسبوعية:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            DataTable(
              border: TableBorder.all(),
              headingTextStyle:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              dataTextStyle: TextStyle(
                fontWeight: FontWeight.normal,
              ),
              columns: const [
                DataColumn(
                    label: Text('التمرين',
                        style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('التفاصيل',
                        style: TextStyle(fontWeight: FontWeight.bold))),
              ],
              rows: exercises.entries.map((entry) {
                return DataRow(
                  cells: [
                    DataCell(Text(
                      entry.key,
                      style: TextStyles.medium18,
                    )),
                    DataCell(Text(
                      entry.value.toString(),
                      style: TextStyles.medium18,
                    )), // تأكد من تحويل القيمة إلى نص
                  ],
                );
              }).toList(),
            ),
            SizedBox(height: 32),
            Text(
              'تمارين الكارديو:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            DataTable(
              columns: const [
                DataColumn(
                    label: Text('التمرين',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24))),
              ],
              rows: cardio.map((exercise) {
                return DataRow(
                  cells: [
                    DataCell(
                      Text(
                        exercise.toString(),
                        style: TextStyles.medium18,
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
