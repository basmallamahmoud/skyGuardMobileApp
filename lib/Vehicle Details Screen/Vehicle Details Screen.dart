import 'package:flutter/material.dart';
import 'package:skyguardmobileapp/MapScreen/appbar.dart';
import 'package:skyguardmobileapp/core/resources/reusable/AssetsManager.dart';

class VehicleDetailsScreen extends StatelessWidget {
  final String plate;
  final String brand;
  final String model;
  final int year;
  final bool isActive;

  const VehicleDetailsScreen({
    super.key,
    required this.plate,
    required this.brand,
    required this.model,
    required this.year,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF007BA7); // اللون الأساسي للبروجيكت

    return Scaffold(
      appBar: const WaveAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 5,
              color: Colors.white,
              shadowColor: Colors.grey.shade300,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.directions_car, size: 40, color: primaryColor),
                        const SizedBox(width: 16),
                        Text(
                          "$brand $model",
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Divider(height: 30, thickness: 1.2),
                    _infoRow("Plate Number", plate, icon: Icons.confirmation_number, iconColor: primaryColor),
                    const SizedBox(height: 12),
                    _infoRow("Brand", brand, icon: Icons.business, iconColor: primaryColor),
                    const SizedBox(height: 12),
                    _infoRow("Model", model, icon: Icons.category, iconColor: primaryColor),
                    const SizedBox(height: 12),
                    _infoRow("Year", year.toString(), icon: Icons.calendar_today, iconColor: primaryColor),
                    const SizedBox(height: 12),
                    _infoRow(
                      "Status",
                      isActive ? "Active" : "Inactive",
                      icon: Icons.check_circle,
                      iconColor: primaryColor,
                      valueColor: isActive ? Colors.green : Colors.red,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text("Back to Vehicles"),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade100,
    );
  }

  Widget _infoRow(String title, String value,
      {IconData? icon, Color iconColor = Colors.black, Color valueColor = Colors.black}) {
    return Row(
      children: [
        if (icon != null) Icon(icon, color: iconColor),
        if (icon != null) const SizedBox(width: 12),
        Text("$title: ",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        Expanded(
          child: Text(value,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: valueColor)),
        ),
      ],
    );
  }
}