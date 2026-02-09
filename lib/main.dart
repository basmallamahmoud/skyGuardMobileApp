import 'package:flutter/material.dart';
import 'package:skyguardmobileapp/Splash/splash_screen.dart';
import 'package:skyguardmobileapp/login/login_screen.dart';
import 'package:skyguardmobileapp/testMapScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName:(_)=>SplashScreen(),
       LoginScreen.routeName:(_) => LoginScreen(),
        TestMapScreen.routeName:(_) => TestMapScreen(),
      },
      initialRoute:SplashScreen.routeName,
    );
  }}


