import 'package:flutter/material.dart';
import 'package:skyguardmobileapp/Home_Screen/Home_Screen.dart';
import 'package:skyguardmobileapp/Login_screen.dart';
import 'package:skyguardmobileapp/Register_Screen/Register_Screen.dart';
import 'package:skyguardmobileapp/Splash/splash_screen.dart';
import 'package:skyguardmobileapp/ForgetPassword/ForgetPassword.dart';
import 'package:skyguardmobileapp/vehicles_screen/vehicles_screen.dart';
import 'package:skyguardmobileapp/add_vehicle_screen/add_vehicle_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        SignupScreen.routeName: (_) => SignupScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        Forgetpassword.routeName: (_) => const Forgetpassword(),
        VehiclesScreen.routeName: (_) => const VehiclesScreen(),
        AddVehicleScreen.routeName: (_) => const AddVehicleScreen(),
      },
    );
  }
}