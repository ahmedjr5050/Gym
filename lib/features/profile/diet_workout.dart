import 'package:fitflow/core/utils/app_images.dart';
import 'package:fitflow/features/profile/presention/view/widgets/customappbar.dart';
import 'package:flutter/material.dart';
import 'dart:convert'; // لتحليل بيانات JSON
import 'package:flutter/services.dart'; // لتحميل الملف

class DietWorkout extends StatefulWidget {
  final int index;

  const DietWorkout({Key? key, required this.index}) : super(key: key);

  @override
  _DietWorkoutState createState() => _DietWorkoutState();
}

class _DietWorkoutState extends State<DietWorkout> {
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
      print("JSON Data Loaded: $jsonData"); // طباعة البيانات المحملة
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

    final weeklyDiet = scheduleData!['weekly_diet'] as Map<String, dynamic>?;

    if (weeklyDiet == null || weeklyDiet.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text('الجدول الأسبوعي')),
        body: Center(
            child: Text('لم يتم العثور على بيانات النظام الغذائي الأسبوعي')),
      );
    }

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
            SizedBox(height: 32),
            Text(
              'النظام الغذائي الأسبوعي:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            DataTable(
              border: TableBorder.all(),
              headingRowHeight: 56,
              columns: const [
                DataColumn(label: Text('اليوم')),
                DataColumn(label: Text('الخضروات')),
                DataColumn(label: Text('البروتين')),
                DataColumn(label: Text('العصائر')),
              ],
              rows: weeklyDiet.entries.map((entry) {
                final dayData = entry.value as Map<String, dynamic>;
                return DataRow(
                  cells: [
                    DataCell(Text(dayData['day']?.toString() ?? 'غير محدد')),
                    DataCell(Text(
                        (dayData['vegetables'] as List<dynamic>?)?.join(', ') ??
                            'لا توجد بيانات')),
                    DataCell(Text((dayData['protein_intake'] as List<dynamic>?)
                            ?.join(', ') ??
                        'لا توجد بيانات')),
                    DataCell(Text(
                        (dayData['juice'] as List<dynamic>?)?.join(', ') ??
                            'لا توجد بيانات')),
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
