import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thzhilali/CONSTANTS/my%20colors.dart';
import 'package:thzhilali/CONSTANTS/my%20widget.dart';
import 'package:thzhilali/PROVIDER/homeprovider.dart';
import 'package:thzhilali/PROVIDER/mainprovider.dart';
import 'package:thzhilali/USER/Bottom_screen.dart';
import 'package:thzhilali/USER/Home_Screen.dart';


class signup extends StatelessWidget {
  const signup({super.key});

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
              image: AssetImage("assets/Leonardo_Diffusion_XL_contractor_and_labor_photos_3 1.png"),fit: BoxFit.cover
            )
          ),
          child: Scaffold(
             backgroundColor: Colors.transparent.withOpacity(0.83),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height:height/14,),
                  Center(
                    child: CircleAvatar(
                      backgroundColor:green,
                      radius: 27,
                      child: Icon(Icons.person,color: Colors.white,size: 33,),
                    ),
                  ),
                  SizedBox(height: height/80,),
                  Text("Sign Up",style: TextStyle(fontWeight:FontWeight.w500,fontSize: 20,color:white,fontFamily: "montserrtbold" ),),
                  SizedBox(height: height/12,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Consumer<HomeProvider>(
                      builder: (context,value,child) {
                        return textformfield(TextInputType.text,Colors.green ,"Fullname",Colors.grey,Icons.person,value.Namecontroller1);
                      }
                    ),
                  ),
                  SizedBox(height: height/24,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Consumer<HomeProvider>(
                      builder: (context,value,child) {
                        return textformfield(TextInputType.text,Colors.green ,"Address",Colors.grey,Icons.home_filled,value.Addresscontroller1);
                      }
                    ),
                  ),
                  SizedBox(height: height/24,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Consumer<HomeProvider>(
                      builder: (context,value,child) {
                        return textformfield(TextInputType.number,Colors.green ,"Phone",Colors.grey,Icons.phone,value.Phonecontroller1);
                      }
                    ),
                  ),
                  SizedBox(height: height/10,),
                 Consumer<HomeProvider>(
                    builder: (context,value,child) {
                      return GestureDetector(
                          onTap: () {
                            value.Signupregistration();
                            Navigator.pop(context);
                       },
                          child: logbutton(34, 110, green, 10, "Create", white));
                    }
                  ),
                  SizedBox(height: height/9,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have Account ? ",style: TextStyle(fontSize: 12,color:white),),
                      Text("Log in",style: TextStyle(fontSize: 12,color:green,fontWeight: FontWeight.w500),),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
