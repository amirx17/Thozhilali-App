import 'dart:developer';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thzhilali/CONSTANTS/my%20colors.dart';
import 'package:thzhilali/PROVIDER/homeprovider.dart';
import 'package:thzhilali/USER/Home_Screen.dart';
import 'package:thzhilali/USER/OTP_Screen.dart';


import '../ADMIN/AdminHomeScreen.dart';
import '../USER/Bottom_screen.dart';
import '../USER/Location_Screen.dart';



class LoginProvider extends ChangeNotifier {


  TextEditingController Loginphnnumber=TextEditingController();
  TextEditingController otpverifycontroller = TextEditingController();

  String VerificationId = "";
  TextEditingController otp_verify = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;


  void sendotp(BuildContext context) async {

    await auth.verifyPhoneNumber(
      phoneNumber: "+91${Loginphnnumber.text}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
        ScaffoldMessenger.of(context)
            .showSnackBar( SnackBar(
          backgroundColor: Colors.white,
          content: Text(
              "Verification Completed",style: TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.w800,)),
          duration:
          Duration(milliseconds: 3000),
        ));
        if (kDebugMode) {}
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == "invalid-phone-number") {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(
            content:
            Text("Sorry, Verification Failed"),
            duration: Duration(milliseconds: 3000),
          ));
          if (kDebugMode) {

          }

        }
      },

      codeSent: (String verificationId, int? resendToken) {
        VerificationId = verificationId;

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => otp(),
            ));
        ScaffoldMessenger.of(context)
            .showSnackBar( SnackBar(
          backgroundColor: green,
          content: Text(
              "OTP sent to phone successfully",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600,)),
          duration:
          Duration(milliseconds: 3000),
        ));
        Loginphnnumber.clear();
        log("Verification Id : $verificationId");

      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: const Duration(seconds: 60),
    );
  }
  void verify(BuildContext context) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: VerificationId, smsCode: otpverifycontroller.text);
    await auth.signInWithCredential(credential).then((value) {
      final user = value.user;
      if (user != null) {
        // Navigator.push(context, MaterialPageRoute(builder:  (context) => home(),));
        userAuthorized(user.phoneNumber, context);
      } else {
        if (kDebugMode) {
        }
      }
    });
  }

  Future<void> userAuthorized(String? phoneNumber, BuildContext context) async {
    HomeProvider provider=Provider.of<HomeProvider>(context,listen: false);
    String loginUsername='';
    String loginUsertype='';
    String loginUserid='';
    String productid='';
    String userId='';
    String loginphno="";
    String loginPhoto="";
    String loginaddress="";

    try {
      var phone = phoneNumber!;
      print(phoneNumber.toString()+"duudud");
      db.collection("USER").where("USER_PHONE",isEqualTo:phone).get().then((value) {
        if(value.docs.isNotEmpty){
          print("fiifuif"+phone);
          for(var element in value.docs) {
            print("ghjk"+element.id);
            Map<dynamic, dynamic> map = element.data();
            loginUsername = map['USER_NAME'].toString();
            loginUsertype = map['TYPE'].toString();
            loginphno=map["USER_PHONE"].toString();
            loginUserid = element.id;
            userId = map["USER_ID"].toString();
            String uid = userId;
            if (loginUsertype == "ADMIN") {
              print("cb bcb");
               Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Adminhome(),));
            }
            else {
              db.collection("CUSTOMER").doc(element.id).get().then((valueee){
                if(valueee.exists){
                  print("cxcjjjc"+valueee.id);
                  Map<dynamic, dynamic> customerMap = valueee.data() as Map;
                  loginPhoto= customerMap["PHOTO"]??"";
                  loginaddress= customerMap["SIGNUP_ADDRESS"].toString();

                  print("dkdkdd");

                  provider.getcarousel();
                  provider.getCategory();
                  provider.getprofile(userId);
                  print("mxnxn");

                  // provider.mainLocation==""?showDialog(
                  //   context: context,
                  //   barrierDismissible: false,
                  //   builder: (context) => AlertDialog(
                  //     title: Center(
                  //       child: Column(
                  //         children: [
                  //           CircleAvatar(
                  //             backgroundColor:Colors.green,
                  //             radius: 30,
                  //             child: Icon(Icons.location_on,color: Colors.white,size: 33,),
                  //           ),
                  //           SizedBox(height: 10,),
                  //           const Text("Enable your location",
                  //               style: TextStyle(
                  //                 fontSize: 14,
                  //                 fontFamily: "semibold",
                  //                 color: Colors.black,
                  //               )),
                  //         ],
                  //       ),
                  //     ),
                  //     contentPadding: EdgeInsets.zero,
                  //     backgroundColor: Colors.white,
                  //     content: Padding(
                  //       padding: const EdgeInsets.only(top: 20),
                  //       child: Container(
                  //         height: MediaQuery.of(context).size.height/ 2.7,
                  //         width: MediaQuery.of(context).size.width/1.2,
                  //         decoration: BoxDecoration(
                  //             color: Colors.white,
                  //             borderRadius:
                  //             BorderRadius.circular(30)),
                  //         child: Column(
                  //           children: [
                  //             SizedBox(
                  //               height: 25,
                  //             ),
                  //             Text("Choose your location to start find the",style: TextStyle(color: Colors.grey),),
                  //             Center(child: Text("request around you",style: TextStyle(color: Colors.grey),)),
                  //             SizedBox(height:  MediaQuery.of(context).size.height/ 12,),
                  //             InkWell(
                  //               onTap: () {
                  //                 Navigator.push(context, MaterialPageRoute(builder: (context) => Location_Screen(userid: userId,name: loginUsername,phnnumber: loginphno,address: loginaddress,),));
                  //               },
                  //               child: Container(
                  //                 height:  MediaQuery.of(context).size.height/ 12,
                  //                 width:  MediaQuery.of(context).size.width/ 1.5,
                  //                decoration: BoxDecoration(
                  //                  gradient: LinearGradient(colors: [Colors.green,Colors.blue]),
                  //                  borderRadius: BorderRadius.circular(10),
                  //                ),
                  //                 child: Center(child: Text("Use My Location",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)),
                  //               ),
                  //             )
                  //
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ) :

                  // provider.getsignup();
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Bottombar( userid: userId,name: loginUsername,phnnumber: loginphno,address: loginaddress,),));
                }
                });



            }
          }

        }
        else {
          const snackBar = SnackBar(
              backgroundColor: Colors.white,
              duration: Duration(milliseconds: 3000),
              content: Text("Sorry , You don't have any access",
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ));

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }

      });


    } catch (e) {


      // const snackBar = SnackBar(
      //     backgroundColor: Colors.white,
      //     duration: Duration(milliseconds: 3000),
      //     content: Text("Sorry , Some Error Occurred",
      //       textAlign: TextAlign.center,
      //       softWrap: true,
      //       style: TextStyle(
      //           fontSize: 18,
      //           color: Colors.black,
      //           fontWeight: FontWeight.bold),
      //     ));
      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

}