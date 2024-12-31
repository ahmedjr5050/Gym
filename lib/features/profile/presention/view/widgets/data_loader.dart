import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;

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