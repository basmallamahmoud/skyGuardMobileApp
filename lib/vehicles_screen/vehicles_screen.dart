import 'package:flutter/material.dart';
import 'package:skyguardmobileapp/MapScreen/appbar.dart';
import 'package:skyguardmobileapp/Vehicle%20Details%20Screen/Vehicle%20Details%20Screen.dart';
import 'package:skyguardmobileapp/add_vehicle_screen/add_vehicle_screen.dart';

class VehiclesScreen extends StatefulWidget {
  static const routeName = '/vehicles';
  const VehiclesScreen({super.key});

  @override
  State<VehiclesScreen> createState() => _VehiclesScreenState();
}

class _VehiclesScreenState extends State<VehiclesScreen> {
  List<Map<String, dynamic>> vehicles = [];

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF007BA7);

    return Scaffold(
      appBar: const WaveAppBar(),
      body: vehicles.isEmpty
          ? const Center(
          child: Text(
            "No vehicles yet. Add one!",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ))
          : ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: vehicles.length,
        itemBuilder: (context, index) {
          final vehicle = vehicles[index];
          return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.directions_car, color: primaryColor),
              ),
              title: Text(
                "${vehicle['brand']} ${vehicle['model']}",
                style:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "${vehicle['plate']} • ${vehicle['year']} • ${vehicle['isActive'] ? "Active" : "Inactive"}",
                style: const TextStyle(fontSize: 14),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => VehicleDetailsScreen(
                      plate: vehicle['plate'],
                      brand: vehicle['brand'],
                      model: vehicle['model'],
                      year: vehicle['year'],
                      isActive: vehicle['isActive'],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () async {
          final newVehicle = await Navigator.push<Map<String, dynamic>>(
            context,
            MaterialPageRoute(builder: (_) => const AddVehicleScreen()),
          );
          if (newVehicle != null) {
            setState(() {
              vehicles.add(newVehicle);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.grey.shade100,
    );
  }
}