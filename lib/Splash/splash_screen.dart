import 'dart:async';
import 'package:flutter/material.dart';
import 'package:skyguardmobileapp/core/resources/reusable/assetsManager.dart';
import 'package:skyguardmobileapp/core/resources/reusable/stringsManager.dart';
import 'package:skyguardmobileapp/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;
  int _dotIndex = 0;

  @override
  void initState() {
    super.initState();

    // Timer لتغيير النقاط كل 500ms
    _timer = Timer.periodic(const Duration(milliseconds: 500), (_) {
      setState(() {
        _dotIndex = (_dotIndex + 1) % 3;
      });
    });

    Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              assetsManager.background,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(assetsManager.logo),
                const SizedBox(height: 20),
                const Text(
                  StringsManager.skyGuard,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    3,
                        (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: _dotIndex == index
                            ? Colors.white
                            : Colors.white54,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}