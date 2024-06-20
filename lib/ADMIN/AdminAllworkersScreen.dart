import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thzhilali/ADMIN/AdminHomeScreen.dart';
import 'package:thzhilali/CONSTANTS/my%20colors.dart';

import '../CONSTANTS/my widget.dart';
import '../USER/Viewmore_Screen.dart';

class Allworkers extends StatelessWidget {
  const Allworkers({super.key});

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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Adminhome(),
                        ));
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: white,
                    size: 19,
                  )),
              centerTitle: true,
              title: Text(
                "All Workers",
                style:
                TextStyle(fontSize: 16, fontFamily: "semibold", color: white),
              ),
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
                child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      // searchbar(TextInputType.text, green, "Search your Worker", Colors.grey, Icons.search, 20, height/17, width/1.13),
                      SizedBox(height: 22,),
                      Container(
                        height: height / 4.2,
                        width: width / 1.1,
                        decoration: BoxDecoration(
                            color: green, borderRadius: BorderRadius.circular(11)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Designer | Flutter Developer",
                                  style: TextStyle(
                                      fontFamily: "semibold",
                                      fontSize: 13,
                                      color: white),
                                ),
                                Text(
                                  "Available",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontFamily: "semibold",
                                      fontSize: 11),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Divider(
                              height: 1,
                              endIndent: 18,
                              indent: 18,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircleAvatar(
                                  radius: 31,
                                  backgroundImage: AssetImage("assets/rahu.jpg"),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: width/1.8,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Rahul-Np",
                                            style: TextStyle(
                                                fontFamily: "montserratmedium",
                                                fontSize: 16,
                                                color: white),
                                          ),
                                          // SizedBox(width: 29,),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 14),
                                            child: Icon(
                                              Icons.favorite,
                                              color: white,
                                              size: 28,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 28,left: 120),
                                      child: Container(
                                        height: height/21,
                                        width: width/4,
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.circular(10),
                                            boxShadow: [BoxShadow(color: Colors.black26,offset: Offset(5, 5),blurRadius: 10)]
                                        ),
                                        child: Center(
                                          child: GestureDetector(
                                            onTap: () {
                                              // Navigator.push(context, MaterialPageRoute(builder: (context) => viewmore(),));
                                            },
                                            child: Text("View More",style: TextStyle(
                                                color: Colors.white70,fontSize: 12
                                            ),),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 22,),
                      Container(
                        height: height / 4.2,
                        width: width / 1.1,
                        decoration: BoxDecoration(
                            color: green, borderRadius: BorderRadius.circular(11)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Designer | Flutter Developer",
                                  style: TextStyle(
                                      fontFamily: "semibold",
                                      fontSize: 13,
                                      color: white),
                                ),
                                Text(
                                  "Available",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontFamily: "semibold",
                                      fontSize: 11),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Divider(
                              height: 1,
                              endIndent: 18,
                              indent: 18,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Row( 
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircleAvatar(
                                  radius: 31,
                                  backgroundImage: AssetImage("assets/praju.jpg"),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: width/1.8,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Prajeesh-tp",
                                            style: TextStyle(
                                                fontFamily: "montserratmedium",
                                                fontSize: 16,
                                                color: white),
                                          ),
                                          // SizedBox(width: 29,),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 14),
                                            child: Icon(
                                              Icons.favorite,
                                              color: white,
                                              size: 28,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 28,left: 120),
                                      child: Container(
                                        height: height/21,
                                        width: width/4,
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.circular(10),
                                            boxShadow: [BoxShadow(color: Colors.black26,offset: Offset(5, 5),blurRadius: 10)]
                                        ),
                                        child: Center(
                                          child: Text("View More",style: TextStyle(
                                              color: Colors.white70,fontSize: 12
                                          ),),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]
                )
            )
        )
    );
  }
}

