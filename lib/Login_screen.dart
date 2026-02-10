import 'package:flutter/material.dart';
import 'package:skyguardmobileapp/Home_Screen/Home_Screen.dart';
import 'package:skyguardmobileapp/MapScreen/mapsScreen.dart';
import 'package:skyguardmobileapp/Register_Screen/Register_Screen.dart';
import 'package:skyguardmobileapp/core/resources/reusable/AssetsManager.dart';
import 'package:skyguardmobileapp/core/resources/reusable/CustomField.dart';
import 'package:skyguardmobileapp/core/resources/reusable/StringsManager.dart';
import 'package:skyguardmobileapp/googleButton.dart';
import 'package:skyguardmobileapp/ForgetPassword/ForgetPassword.dart';
import 'package:skyguardmobileapp/testMapScreen.dart';



class LoginScreen extends StatefulWidget {
  static const String routeName = "login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          AssetsManager.appbar,
          height: 450,
          width: 170,
          color: const Color(0xFF007ba7),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(17),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// Title
                Text(
                  StringsManager.loginAccount,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Color(0xFF007ba7),
                  ),
                ),

                const SizedBox(height: 24),

                /// Email Field
                CustomField(
                  icon: AssetsManager.email,
                  title: StringsManager.email,
                ),

                const SizedBox(height: 12),

                /// Password Field
                CustomField(
                  icon: AssetsManager.pass,
                  title: StringsManager.password,
                  isPassword: true,
                ),

                const SizedBox(height: 8),

                /// Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Forgetpassword.routeName);
                    },
                    child: Text(StringsManager.forgetPassword,style: TextStyle(color: Color(0xFF007ba7),fontSize: 15,fontWeight: FontWeight.w500)),
                  ),
                ),

                const SizedBox(height: 16),

                /// Login Button
                SizedBox(
                  width: double.infinity,
                  child:
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF007ba7),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(StringsManager.loginAccount,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                  ),
                ),

                const SizedBox(height: 20),

                /// Sign up Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(StringsManager.noAccount),
                    TextButton(
                      style: TextButton.styleFrom(padding: EdgeInsets.zero,),
                        onPressed: () {
                        Navigator.pushReplacementNamed(context, SignupScreen.routeName);
                        },
                      child: Text(StringsManager.signup,style: TextStyle(color: Color(0xFF007ba7)),),
                    ),
                  ],
                ),
                GoogleButton(title: StringsManager.loginAccount)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    if (formKey.currentState?.validate() ?? false) {
      // login logic
    }
  }
}