import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thzhilali/CONSTANTS/my%20colors.dart';
import 'package:thzhilali/CONSTANTS/my%20widget.dart';
import 'package:thzhilali/USER/login_Screen.dart';

class about extends StatelessWidget {
  const about({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Container(
          height: height,width: width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Leonardo_Diffusion_XL_contractor_and_labor_photos_3 1.png"),fit: BoxFit.cover
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent.withOpacity(0.83),
            body:Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18,top: 35),
                  child: Text("Welcome to Thozhilali app !",style: TextStyle(color: white,fontSize: 14,fontFamily: "montserrtbold"),),
                ),
                SizedBox(height: height/16,),
              ],
            ),
            floatingActionButton: Container(
              height: 32,
              width: 79,
              decoration: BoxDecoration(
                color: green,
                borderRadius: BorderRadius.circular(7),
              ),
              child: FloatingActionButton(
                backgroundColor: green,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => login(),));
                },
                child: Center(child: Text("Skip",style: TextStyle(color: white,fontSize: 12,fontFamily: "montserratmedium"))),
              ),
            ),
          ),
        ));
  }
}
 