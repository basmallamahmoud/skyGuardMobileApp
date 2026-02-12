import 'package:flutter/material.dart';
import 'package:skyguardmobileapp/MapScreen/appbar.dart';
import 'package:skyguardmobileapp/Tabs/Alert_Tab.dart';
import 'package:skyguardmobileapp/Tabs/History_Tab.dart';
import 'package:skyguardmobileapp/Tabs/Home_Tab.dart';
import 'package:skyguardmobileapp/Tabs/Proofile_Tab.dart';
import 'package:skyguardmobileapp/core/resources/reusable/AssetsManager.dart';
import 'package:skyguardmobileapp/core/resources/reusable/StringsManager.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> tabs = const [
    HomeTab(),
    AlertsTab(),
      HistoryTab(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: const WaveAppBar(),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Image.asset(AssetsManager.add),
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) {
          setState(() => selectedIndex = value);
        },
        height: 70,
        destinations: [
          _buildNavItem(AssetsManager.home, StringsManager.home, 0),
          _buildNavItem(AssetsManager.alert, StringsManager.alert, 1),
          _buildNavItem(AssetsManager.history, StringsManager.history, 2),
          _buildNavItem(AssetsManager.profile, StringsManager.profile, 3),
        ],
      ),

      body: tabs[selectedIndex],
    );
  }

  NavigationDestination _buildNavItem(String iconPath, String label, int index) {
    bool isSelected = selectedIndex == index;

    return NavigationDestination(
      icon: Container(
        padding: EdgeInsets.all(isSelected ? 10 : 0),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF007BA7) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Image.asset(
          iconPath,
          width: isSelected ? 20 : 30,
          height: isSelected ? 20 : 30,
          color: isSelected ? Colors.white : const Color(0xFF007BA7),
        ),
      ),
      label: label,
    );
  }
}