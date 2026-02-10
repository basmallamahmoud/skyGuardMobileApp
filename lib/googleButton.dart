
import 'package:flutter/material.dart';
import 'package:skyguardmobileapp/core/resources/reusable/AssetsManager.dart';
class GoogleButton extends StatelessWidget {
  String title;
  GoogleButton({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider(
              color:Colors.black26,
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text("Or",style:TextStyle(color: Color(0xFF007ba7))),
            ),
            Expanded(child: Divider(
              color: Colors.black26,
            )),
          ],
        ),
        SizedBox(height: 40,),
        ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(

                backgroundColor:Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(16)
                )

            ),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AssetsManager.google),
                SizedBox(width: 16,),
                Text(title,style: TextStyle(color:Color(0xFF007ba7), fontSize: 18,fontWeight: FontWeight.w600,)),

              ],
            ))

      ],
    );
  }
}
