import 'package:flutter/material.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("History"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Trips", icon: Icon(Icons.route)),
              Tab(text: "Accidents", icon: Icon(Icons.warning)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TripsTab(),
            AccidentsTab(),
          ],
        ),
      ),
    );
  }
}

class TripsTab extends StatelessWidget {
  const TripsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: const Icon(Icons.directions_car),
            title: Text("Trip ${index + 1}"),
            subtitle: const Text(
              "Distance: 12 km • Avg Speed: 60 km/h",
            ),
            trailing: const Text("Feb 10"),
            onTap: () {},
          ),
        );
      },
    );
  }
}

class AccidentsTab extends StatelessWidget {
  const AccidentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.red.shade50,
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: const Icon(Icons.warning, color: Colors.red),
            title: Text("Accident ${index + 1}"),
            subtitle: const Text(
              "Severity: Medium • Location detected",
            ),
            trailing: const Text("Feb 8"),
            onTap: () {},
          ),
        );
      },
    );
  }
}