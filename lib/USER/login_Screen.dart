import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thzhilali/CONSTANTS/my%20colors.dart';
import 'package:thzhilali/PROVIDER/loginprovider.dart';
import 'package:thzhilali/USER/OTP_Screen.dart';
import 'package:thzhilali/USER/signup_Screen.dart';

import '../CONSTANTS/my widget.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(height: height,width: width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    "assets/Leonardo_Diffusion_XL_contractor_and_labor_photos_3 1.png"),fit:BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent.withOpacity(0.83),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height:height/8,),
                Center(
                  child: CircleAvatar(
                    backgroundColor:green,
                    radius: 27,
                    child: Icon(Icons.person,color: Colors.white,size: 33,),
                  ),
                ),
                SizedBox(height: height/80,),
                Text("Log in",style: TextStyle(fontWeight:FontWeight.w500,fontSize: 20,color:white,fontFamily: "montserrtbold" ),),
                SizedBox(height: height/8,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Consumer<LoginProvider>(
                    builder: (context,value,child) {
                      return textformfield(TextInputType.phone,Colors.green ,"Phone",Colors.grey,Icons.phone,value.Loginphnnumber);
                    }
                  ),
                ),
                SizedBox(height: height/6.5,),
                Consumer<LoginProvider>(
                  builder: (context,value,child) {
                    return GestureDetector(
                      onTap: () {
                        value.sendotp(context);
                      },
                        child: logbutton(34, 110,green, 10, "Get OTP", white));
                  }
                ),
                SizedBox(height: height/4.6,),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => signup(),));
                  },
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Need an Account ? ",style: TextStyle(fontSize: 12,color:white),),
                      Text("Sign Up",style: TextStyle(fontSize: 14,color:green,fontWeight: FontWeight.w500),),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
