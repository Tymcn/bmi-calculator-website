import 'package:flutter/material.dart';
import '../logic/history_service.dart';
import '../constants.dart';
import '../l10n/app_localizations.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final HistoryService historyService = HistoryService();

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.history),
        centerTitle: true,
      ),
      body: FutureBuilder<List<BMIHistory>>(
        future: historyService.getHistory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No history yet"));
          }

          final history = snapshot.data!;
          return ListView.builder(
            itemCount: history.length,
            itemBuilder: (context, index) {
              final item = history[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                color: kInactiveCardColour,
                child: ListTile(
                  title: Text(
                    "${item.bmi} - ${item.result}",
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  subtitle: Text(item.date),
                  leading: CircleAvatar(
                    backgroundColor: kBottomContainerColour,
                    child: const Icon(Icons.show_chart, color: Colors.white),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
