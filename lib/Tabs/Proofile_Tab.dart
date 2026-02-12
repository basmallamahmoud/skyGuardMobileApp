import 'package:flutter/material.dart';
import 'package:skyguardmobileapp/core/resources/reusable/AssetsManager.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _nameController = TextEditingController(text: "John Doe");
  final _emailController = TextEditingController(text: "john@example.com");
  final _phoneController = TextEditingController(text: "+20123456789");

  bool _isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.check : Icons.edit),
            onPressed: () {
              setState(() {
                if (_isEditing) {
                  // Save profile logic هنا بعد الربط بالباك
                }
                _isEditing = !_isEditing;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Picture
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(AssetsManager.logo),
                  backgroundColor: Colors.white,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: InkWell(
                    onTap: () {
                      // Pick image from gallery/camera
                    },
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.blue,
                      child: const Icon(Icons.camera_alt, size: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Name
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Full Name",
                border: OutlineInputBorder(),
              ),
              enabled: _isEditing,
            ),
            const SizedBox(height: 12),
            // Email
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
              enabled: _isEditing,
            ),
            const SizedBox(height: 12),
            // Phone
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: "Phone",
                border: OutlineInputBorder(),
              ),
              enabled: _isEditing,
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Logout logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF009EDC),
                ),
                child: const Text("Logout",style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}