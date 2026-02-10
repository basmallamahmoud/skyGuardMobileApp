import 'package:flutter/material.dart';
import 'package:skyguardmobileapp/Login_screen.dart';
import 'package:skyguardmobileapp/core/resources/reusable/AssetsManager.dart';
import 'package:skyguardmobileapp/core/resources/reusable/StringsManager.dart';
class Forgetpassword extends StatelessWidget {
  static const String routeName ="forget";
  const Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
            leading:IconButton(onPressed: (
                ){
            Navigator.pushReplacementNamed(context,LoginScreen. routeName);
            }, icon:
            Image.asset(AssetsManager.leading,)
            ),

            title: Text(StringsManager.forgetpass,style:
            TextStyle(fontSize: 22,fontWeight: FontWeight.w500)
            ),

        ),
        body: Padding(padding:
        EdgeInsetsGeometry.all(16),
          child: Column(
            children: [
              Image.asset(AssetsManager.forgetPass,color: Color(0xFF007ba7)),
              SizedBox(height: 40,),
              Container(
                  width: double.infinity,
                  child:
                  SizedBox(
                    width: double.infinity,
                    child:
                    ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF007ba7),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: Text(StringsManager.resetPass,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                    ),
                  ),)
            ],
          ),
        )
    );;
  }
}
