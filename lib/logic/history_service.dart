import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class BMIHistory {
  final String date;
  final String bmi;
  final String result;

  BMIHistory({required this.date, required this.bmi, required this.result});

  Map<String, dynamic> toJson() => {
        'date': date,
        'bmi': bmi,
        'result': result,
      };

  factory BMIHistory.fromJson(Map<String, dynamic> json) => BMIHistory(
        date: json['date'],
        bmi: json['bmi'],
        result: json['result'],
      );
}

class HistoryService {
  static const String _historyKey = 'bmi_history';

  Future<void> saveResult(String bmi, String result) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> historyList = prefs.getStringList(_historyKey) ?? [];
    
    final newEntry = BMIHistory(
      date: DateTime.now().toString().substring(0, 16),
      bmi: bmi,
      result: result,
    );

    historyList.insert(0, jsonEncode(newEntry.toJson()));
    
    // Keep only last 10 entries
    if (historyList.length > 10) {
      historyList.removeLast();
    }

    await prefs.setStringList(_historyKey, historyList);
  }

  Future<List<BMIHistory>> getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> historyList = prefs.getStringList(_historyKey) ?? [];
    
    return historyList
        .map((item) => BMIHistory.fromJson(jsonDecode(item)))
        .toList();
  }
}
