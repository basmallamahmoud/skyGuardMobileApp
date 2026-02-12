import 'package:flutter/material.dart';

class AlertsTab extends StatelessWidget {
  const AlertsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alerts"),
      ),
      body: Column(
        children: [
          // Dashboard counters
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _counterCard("New", 3, Colors.red),
                _counterCard("Responded", 5, Colors.green),
                _counterCard("Pending", 2, Colors.orange),
              ],
            ),
          ),
          const Divider(),
          // Alerts list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.yellow.shade50,
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: const Icon(Icons.warning, color: Colors.red),
                    title: Text("Accident Alert ${index + 1}"),
                    subtitle: const Text(
                        "Location: Main Street • Time: 10:30 AM"),
                    trailing: Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "Pending",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    onTap: () {
                      // Navigate to alert details
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _counterCard(String title, int count, Color color) {
    return Card(
      color: color.withOpacity(0.1),
      elevation: 2,
      child: Container(
        width: 100,
        height: 80,
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$count",
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold, color: color),
            ),
            const SizedBox(height: 4),
            Text(title, style: TextStyle(color: color)),
          ],
        ),
      ),
    );
  }
}