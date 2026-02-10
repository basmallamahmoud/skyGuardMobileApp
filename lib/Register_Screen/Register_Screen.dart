import 'package:flutter/material.dart';
import 'package:skyguardmobileapp/Login_screen.dart';
import 'package:skyguardmobileapp/core/resources/reusable/AssetsManager.dart';
import 'package:skyguardmobileapp/core/resources/reusable/CustomField.dart';
import 'package:skyguardmobileapp/core/resources/reusable/StringsManager.dart';
import 'package:skyguardmobileapp/googleButton.dart';


class SignupScreen extends StatefulWidget {
  static const String routeName = "signup";

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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
                  StringsManager.createAccount,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Color(0xFF007ba7),
                  ),
                ),

                const SizedBox(height: 24),

                /// Name
                CustomField(
                  controller: nameController,
                  icon: AssetsManager.user,
                  title: StringsManager.enterName,
                ),

                const SizedBox(height: 12),

                /// Email
                CustomField(
                  controller: emailController,
                  icon: AssetsManager.email,
                  title: StringsManager.enterMail,
                ),

                const SizedBox(height: 12),

                /// Password
                CustomField(
                  controller: passwordController,
                  icon: AssetsManager.pass,
                  title: StringsManager.enterPass,
                  isPassword: true,
                ),

                const SizedBox(height: 12),

                /// Confirm Password
                CustomField(
                  controller: confirmPasswordController,
                  icon: AssetsManager.pass,
                  title: StringsManager.confirmPass,
                  isPassword: true,
                ),

                const SizedBox(height: 20),

                /// Sign up button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: signup,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF007ba7),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(StringsManager.signup,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),
                  ),
                ),),

                const SizedBox(height: 20),

                /// Login link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(StringsManager.haveAccount),
                    TextButton(
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                      },
                      child: Text(StringsManager.login,style: TextStyle(color: Color(0xFF007ba7)),),
                    ),
                  ],
                ),
                GoogleButton(title: StringsManager.googleSignUp)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signup() {
    if (formKey.currentState?.validate() ?? false) {
      // signup logic
    }
  }
}