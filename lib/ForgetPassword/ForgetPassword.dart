import 'package:flutter/material.dart';

class Forgetpassword extends StatefulWidget {
  static const String routeName = "forgetpassword";
  const Forgetpassword({super.key});

  @override
  State<Forgetpassword> createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Forget Password")),
      body: const Center(child: Text("Forget Password Screen")),
    );
  }
}