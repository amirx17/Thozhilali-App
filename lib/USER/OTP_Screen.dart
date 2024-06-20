import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:thzhilali/CONSTANTS/my%20colors.dart';
import 'package:thzhilali/CONSTANTS/my%20widget.dart';
import 'package:thzhilali/USER/signup_Screen.dart';

import '../PROVIDER/loginprovider.dart';

class otp extends StatelessWidget {
  const otp({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  "assets/Leonardo_Diffusion_XL_contractor_and_labor_photos_3 1.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent.withOpacity(0.83),
        body: Column(
          children: [
            SizedBox(
              height: height / 7,
            ),
            Center(
                child: GestureDetector(
                   onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => signup(),));
                   },
                  child: Text(
              "Enter OTP",
              style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: white,
                    fontFamily: "montserrtbold"),
            ),
                )),
            SizedBox(height: height/13,),
            Consumer<LoginProvider>(
                builder: (context,vale,child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child:Pinput(
                      controller:vale.otpverifycontroller,
                      length: 6,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      defaultPinTheme: PinTheme(
                          textStyle:
                          TextStyle(fontWeight: FontWeight.bold),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration( boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 2.0, // soften the shadow
                              spreadRadius: 1.0, //extend the shadow
                            ),
                          ], borderRadius: BorderRadius.circular(15),
                              border: Border.all(width: 1,
                                  color:Colors.white.withOpacity(0.9)))),

                      onCompleted: (pin){
                        vale.verify(context);

                      },

                    ),
                  );
                }
            ),
            SizedBox(height: height/17,),
            Center(
                child: OtpTimerButton(
                  backgroundColor: Colors.white,
                  // controller: controller,
                  onPressed: () {},
                  text: Text('OTP auto resend in :',style: TextStyle(
                    color: green,
                    fontWeight: FontWeight.w500,fontSize: 16, ),),
                  duration: 60,
                ),
                ),
          ],
        ),
      ),
    ));
  }
}
