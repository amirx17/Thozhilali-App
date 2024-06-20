import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thzhilali/ADMIN/AdminAllworkersScreen.dart';
import 'package:thzhilali/ADMIN/AdminCategoriesScreen.dart';
import 'package:thzhilali/ADMIN/AdminNotification_Screen.dart';
import 'package:thzhilali/ADMIN/AdminRegistration_Scren.dart';
import 'package:thzhilali/ADMIN/AdminSubCategory_Screen.dart';
import 'package:thzhilali/ADMIN/Carousel_Screen.dart';
import 'package:thzhilali/ADMIN/UserList_Screen.dart';
import 'package:thzhilali/CONSTANTS/my%20colors.dart';
import 'package:thzhilali/CONSTANTS/my%20widget.dart';
import 'package:thzhilali/PROVIDER/homeprovider.dart';



import '../USER/login_Screen.dart';

class Adminhome extends StatelessWidget {
  const Adminhome({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor:green,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: green,
            leading: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                  backgroundColor: green,
                  elevation: 20,
                  content:  Text(
                      "Do you want to Logout ?",style: TextStyle(
                      fontSize:17,

                      fontFamily:'ink nut',
                      fontWeight: FontWeight.w700,
                      color: Colors.white)),
                  actions: <Widget>[
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            FirebaseAuth auth = FirebaseAuth.instance;
                            auth.signOut();
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => login(),));
                          },
                          child: Container(
                            height: 45,
                            width: 90,
                            decoration: BoxDecoration(
                                color:Colors.white ,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x26000000),
                                    blurRadius: 2.0, // soften the shadow
                                    spreadRadius: 1.0, //extend the shadow
                                  ),
                                ] ),
                            child: Center(child:  Text("yes",style: TextStyle( color: Colors.black,fontSize: 17,fontWeight: FontWeight.w700))),
                          ),
                        ),
                        TextButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 45,
                              width: 90,

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x26000000),
                                    blurRadius: 2.0, // soften the shadow
                                    spreadRadius: 1.0, //extend the shadow
                                  ),
                                ],
                              ),
                              child: Center(child: Text("No",style: TextStyle( color: Colors.black,fontSize: 17,fontWeight: FontWeight.w700))),
                            ))
                      ],
                    )

                  ],
                ),
                );
              },
                child: Icon(Icons.logout,color: Colors.green,)),
            centerTitle: true,
            title: Text(
              "Home",
              style: TextStyle(
                  fontSize: 18, fontFamily: "semibold", color: white),
            ),

          )),
      body: Container(
        height: height,
        width: width / 1,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 24,),
              Consumer<HomeProvider>(
                builder: (context,value,child) {
                  return GestureDetector(
                    onTap: () {
                      value.getsignup();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Userlist(),));
                    },
                      child: homead(height/10, width/1.1, green, 10, "User List"));
                }
              ),
              Consumer<HomeProvider>(
                builder: (context,value,child) {
                  return GestureDetector(
                      onTap: () {
                        value.getcarousel();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Carousel(),));
                      },
                      child: homead(height/10, width/1.1, green, 10, "Carousel"));
                }
              ),
              Consumer<HomeProvider>(
                builder: (context,value,child) {
                  return GestureDetector(
                      onTap: () {
                        value.getWorkerRegistration();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AdminRegistration(),));
                      },
                      child: homead(height/10, width/1.1, green, 10, "Registration"));
                }
              ),
              Consumer<HomeProvider>(
                builder: (context,value,child) {
                  return GestureDetector(
                      onTap: () {
                        value.getCategory();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AdminScreen(),));
                      },
                      child: homead(height/10, width/1.1, green, 10, "Categories"));
                }
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AdminNoti(),));
                  },
                  child: homead(height/10, width/1.1, green, 10, "Notifications")),
              Consumer<HomeProvider>(
                builder: (context,value,child) {
                  return GestureDetector(
                      onTap: () {
                        value.getSubcategory();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AdminSubCategory(),));
                      },
                      child: homead(height/10, width/1.1, green, 10, "Sub Category"));
                }
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Allworkers(),));
                  },
                  child: homead(height/10, width/1.1, green, 10, "All Workers")),
            ],
          ),
        ),

      ),
    );
  }
}
