import 'package:flutter/material.dart';
import 'package:skyguardmobileapp/Home_Screen/Home_Screen.dart';
import 'package:skyguardmobileapp/Login_screen.dart';
import 'package:skyguardmobileapp/Register_Screen/Register_Screen.dart';
import 'package:skyguardmobileapp/Splash/splash_screen.dart';
import 'package:skyguardmobileapp/ForgetPassword/ForgetPassword.dart';
import 'package:skyguardmobileapp/MapScreen/mapsScreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
        SignupScreen.routeName: (_) => SignupScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        Forgetpassword.routeName: (_) => Forgetpassword(),

      },
      initialRoute: SplashScreen.routeName,
    );
  }
}

