import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thzhilali/PROVIDER/homeprovider.dart';
import 'package:thzhilali/USER/EditWorkProfile_Screen.dart';
import 'package:thzhilali/USER/profile_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../CONSTANTS/my colors.dart';
import 'Registration_Screen.dart';
import 'login_Screen.dart';

class Mainprofile extends StatelessWidget {
  String userid;
  String name;
  String phnnumber;
  String address;
  Mainprofile({super.key, required this.userid, required this.name, required this.phnnumber, required this.address,});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: green,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(75),
            child: AppBar(
              backgroundColor: green,
              leading: GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => Bottombar(),
                  //     ));
                },
                // child: Icon(
                //   Icons.arrow_back_ios,
                //   color: white,
                //   size: 19,
              ),
              centerTitle: true,
              title: Text(
                "Profile",
                style: TextStyle(
                    fontSize: 17, fontFamily: "semibold", color: white),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    backgroundColor: Colors.white,
                                    elevation: 20,
                                    content: Text("Do you want to Logout ?",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontFamily: 'ink nut',
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black)),
                                    actions: <Widget>[
                                      Row(
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              FirebaseAuth auth =
                                                  FirebaseAuth.instance;
                                              auth.signOut();
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        login(),
                                                  ));
                                            },
                                            child: Container(
                                              height: 45,
                                              width: 90,
                                              decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color(0x26000000),
                                                      blurRadius:
                                                          2.0, // soften the shadow
                                                      spreadRadius:
                                                          1.0, //extend the shadow
                                                    ),
                                                  ]),
                                              child: Center(
                                                  child: Text("yes",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 17,
                                                          fontWeight: FontWeight
                                                              .w700))),
                                            ),
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: 45,
                                                width: 90,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: Colors.red,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color(0x26000000),
                                                      blurRadius:
                                                          2.0, // soften the shadow
                                                      spreadRadius:
                                                          1.0, //extend the shadow
                                                    ),
                                                  ],
                                                ),
                                                child: Center(
                                                    child: Text("No",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700))),
                                              ))
                                        ],
                                      )
                                    ],
                                  ));
                        },
                        child: Icon(
                          Icons.logout,
                          color: Colors.green,
                        )),
                    SizedBox(
                      width: 6,
                    ),
                    // Text("Logout",style: TextStyle(color: Colors.green,fontSize: 16),)
                  ],
                ),
              ],
            )),
        body: Container(
          height: height,
          width: width / 1,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: SingleChildScrollView(
               child: Column(children: [
                SizedBox(
               height: height / 28,
            ),
            Consumer<HomeProvider>(
              builder: (context,value,child) {
                return value.profileephoto!=""?CircleAvatar(
                  radius: 40,
                  backgroundColor: green,
                  backgroundImage: NetworkImage(value.profileephoto),
                ):CircleAvatar(
                  radius: 40,
                  backgroundColor: green,
                  child: Icon(
                    Icons.person,
                    size: 55,
                    color: white,
                  ),
                );
              }
            ),
            SizedBox(
              height: 10,
            ),
            Text(name,style: TextStyle(color: Colors.green,fontWeight: FontWeight.w500),),
            Text(phnnumber),
            SizedBox(
              height: height / 8,
            ),
            Consumer<HomeProvider>(builder: (context, value, child) {
              return InkWell(
                onTap: () {
                  // print("dcknndcc" + userid);
                  value.getsignup();
                  value.Editcustomer(userid);
                  value.getprofile(userid);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(userid: userid, Name: name,Addrss: address, Phonnmbr: phnnumber),
                      ));
                },
                child: Container(
                  height: 65,
                  width: width / 1.12,
                  decoration: BoxDecoration(
                      color: green, borderRadius: BorderRadius.circular(35)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 18,
                      ),
                      Icon(
                        Icons.edit,
                        color: Colors.green,
                        size: 25,
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      Text("Edit Profile",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontFamily: "montserratmedium")),
                      SizedBox(
                        width: 140,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.green,
                        size: 17,
                      )
                    ],
                  ),
                ),
              );
            }
            ),
                 SizedBox(height: 15,),
                 Consumer<HomeProvider>(
                   builder: (context,value,child) {
                     return InkWell(
                       onTap: () {
                         value.EditUsergetWorkerRegistration(userid);
                         Navigator.push(context, MaterialPageRoute(builder: (context) =>Workersregistration(From:"", userid: userid),));
                       },
                       child: Container(
                         height: 65,
                         width: width / 1.12,
                         decoration: BoxDecoration(
                             color: green, borderRadius: BorderRadius.circular(35)),
                         child: Row(
                           children: [
                             SizedBox(
                               width: 18,
                             ),
                             Icon(
                               Icons.edit,
                               color: Colors.green,
                               size: 25,
                             ),
                             SizedBox(
                               width: 18,
                             ),
                             Text("Edit Work Profile",
                                 style: TextStyle(
                                     color: Colors.white,
                                     fontSize: 13,
                                     fontFamily: "montserratmedium")),
                             SizedBox(
                               width: 100,
                             ),
                             Icon(
                               Icons.arrow_forward_ios,
                               color: Colors.green,
                               size: 17,
                             )
                           ],
                         ),
                       ),
                     );
                   }
                 ),
          ]
               ),
          ),

        ));
  }
}
