import 'package:flutter/material.dart';
import 'package:skyguardmobileapp/MapScreen/appbar.dart';

class AddVehicleScreen extends StatefulWidget {
  static const String routeName = "addVehicle";

  const AddVehicleScreen({super.key});

  @override
  State<AddVehicleScreen> createState() => _AddVehicleScreenState();
}

class _AddVehicleScreenState extends State<AddVehicleScreen> {
  final _formKey = GlobalKey<FormState>();
  final _plateController = TextEditingController();

  String? _selectedBrand;
  String? _selectedModel;
  int? _selectedYear;

  final Map<String, List<String>> brandsModels = {
    "Toyota": ["Corolla", "Camry", "RAV4"],
    "Honda": ["Civic", "Accord", "CR-V"],
    "Ford": ["Focus", "Fiesta", "Mustang"],
  };

  List<String> get modelsForSelectedBrand =>
      _selectedBrand != null ? brandsModels[_selectedBrand!]! : [];

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF007BA7); // اللون الأساسي

    return Scaffold(
      appBar: const WaveAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField("Plate Number", _plateController),
              const SizedBox(height: 12),
              _buildDropdown(
                  label: "Brand",
                  value: _selectedBrand,
                  items: brandsModels.keys.toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedBrand = value;
                      _selectedModel = null;
                    });
                  }),
              const SizedBox(height: 12),
              _buildDropdown(
                  label: "Model",
                  value: _selectedModel,
                  items: modelsForSelectedBrand,
                  onChanged: (value) {
                    setState(() {
                      _selectedModel = value;
                    });
                  }),
              const SizedBox(height: 12),
              _buildYearPicker(primaryColor),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      textStyle:
                      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final newVehicle = {
                        "plate": _plateController.text,
                        "brand": _selectedBrand,
                        "model": _selectedModel,
                        "year": _selectedYear,
                        "isActive": true,
                      };
                      Navigator.pop(context, newVehicle);
                    }
                  },
                  child: const Text("Save Vehicle", style: TextStyle(color: Colors.white,fontSize: 20)),
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: Colors.white,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return "Please enter $label";
        return null;
      },
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      items: items
          .map((item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      ))
          .toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: Colors.white,
      ),
      validator: (value) {
        if (value == null) return "Please select $label";
        return null;
      },
    );
  }

  Widget _buildYearPicker(Color primaryColor) {
    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
        labelText: _selectedYear == null ? "Select Year" : "Year: $_selectedYear",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: Colors.white,
        suffixIcon: Icon(Icons.calendar_today, color: primaryColor),
      ),
      onTap: () async {
        final currentYear = DateTime.now().year;
        final picked = await showDatePicker(
          context: context,
          initialDate: DateTime(currentYear),
          firstDate: DateTime(1990),
          lastDate: DateTime(currentYear),
        );
        if (picked != null) {
          setState(() {
            _selectedYear = picked.year;
          });
        }
      },
      validator: (value) {
        if (_selectedYear == null) return "Please select year";
        return null;
      },
    );
  }
}