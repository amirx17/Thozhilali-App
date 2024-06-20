import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thzhilali/USER/about_Screen.dart';
import 'package:thzhilali/USER/login_Screen.dart';

import '../PROVIDER/loginprovider.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}






class _splashScreenState extends State<splashScreen> {


  void initState() {

    final FirebaseFirestore db = FirebaseFirestore.instance;
    String type= '';

    FirebaseAuth auth = FirebaseAuth.instance;
    var loginUser = auth.currentUser;

    super.initState();

    LoginProvider loginProvider = Provider.of<LoginProvider>(context, listen: false);


    Timer(const Duration(seconds: 3), () {
      if (loginUser == null) {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>about(),));
      }
      else {
        print("bnm"+loginUser.phoneNumber.toString());
        loginProvider.userAuthorized(loginUser.phoneNumber, context);
      }
    });






    super.initState();



  }
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
              fit: BoxFit.cover
        )),
        child: Scaffold(
          backgroundColor:Colors.transparent.withOpacity(0.85) ,
          body: Center(child: GestureDetector(onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => about(),));
          },
              child: Image.asset("assets/Group 6.png",scale: 5,))),
        ),
      ),
    );
  }
}
