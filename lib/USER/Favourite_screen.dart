import 'package:flutter/material.dart';
import 'package:thzhilali/USER/Bottom_screen.dart';

import '../CONSTANTS/my colors.dart';
import 'Home_Screen.dart';

class Favourite_screen extends StatelessWidget {
  const Favourite_screen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor:green,
        appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),
    child: AppBar(
    backgroundColor: green,
    leading: GestureDetector(
    // onTap: () {
    // Navigator.push(
    // context,
    // MaterialPageRoute(
    // builder: (context) => Bottombar(),
    // ));
    // },
    // child: Icon(
    // Icons.arrow_back_ios,
    // color: white,
    // size: 19,
    // )
    ),
    centerTitle: true,
    title: Text(
    "Favourites",
    style: TextStyle(
    fontSize: 17, fontFamily: "semibold", color: white),
    ),
    )),
    body:
    Container(
    height: height,
    width: width / 1,
    decoration: BoxDecoration(
    color: white,
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(30),
    topRight: Radius.circular(30)),
    ),
     child:   SingleChildScrollView(
       child: Column(
            children: [
              SizedBox(height: 22,),
              Container(
                height: height/1.55,
                width: width/1.1,
                decoration: BoxDecoration(
                    color: green,
                    borderRadius: BorderRadius.circular(11)
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Designer | Flutter Developer",style: TextStyle(fontFamily: "semibold",fontSize: 13,color: white),),
                        Text("Available",style: TextStyle(color: Colors.green,fontFamily: "semibold",fontSize: 11),)
                      ],
                    ),
                    SizedBox(height: 6,),
                    Divider(
                      height: 1,
                      endIndent: 18,
                      indent: 18,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 18,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundImage: AssetImage("assets/rahu.jpg"),
                        ),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 200,
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Rahul-Np",style: TextStyle(fontFamily: "montserratmedium",fontSize: 14,color: white),),
                                  // SizedBox(width: 29,),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Icon(Icons.favorite,color: Colors.red,size: 28,),
                                  )
                                ],
                              ),
                            ),
                            Text("2 Year experience",style: TextStyle(fontFamily: "montserratmedium",fontSize: 12,color: white),),
                            Text("22 age",style: TextStyle(fontFamily: "montserratmedium",fontSize: 12,color: white),),
                            Row(
                              children: [
                                // Icon(Icons.location_on,color: white,size: 18),
                                Text("Kozhikode-Palakkad highway",style: TextStyle(fontFamily: "montserratmedium",fontSize: 12,color: white),),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.star,color: Colors.orange,size: 12,),
                                Icon(Icons.star,color: Colors.orange,size: 12,),
                                Icon(Icons.star,color: Colors.orange,size: 12,),
                                Icon(Icons.star,color: Colors.orange,size: 12,),
                                Icon(Icons.star,color: Colors.orange,size: 12,),
                                Text("5.0",style: TextStyle(color: Colors.orange,fontSize: 10),)
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 22,),
                    Padding(
                      padding: const EdgeInsets.only(right: 160),
                      child: Text("Work Related Photos :",style: TextStyle(fontSize: 11,fontFamily: "montserratmedium",color: white,),),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 85,
                          width: 85,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.asset("assets/WhatsApp Image 2024-01-11 at 13.18.22_6dcd3f0b.jpg",fit: BoxFit.cover,)),
                        ),
                        Container(
                            height: 85,
                            width: 85,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.asset("assets/rahulee.jpg",fit: BoxFit.cover,))
                        ),
                        Container(
                            height: 85,
                            width: 85,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.asset("assets/rahulx.jpg",fit: BoxFit.cover,))
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Container(
                      height: height / 21,
                      width: width / 1.7,
                      decoration: BoxDecoration(
                          color:white,
                          borderRadius:
                          BorderRadius.circular(8),
                          boxShadow: [BoxShadow(offset: Offset(2, 2),color: Colors.black45,)]
                      ),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.phone,
                            color: green,
                            size: 19,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "+91 7034756547",
                            style: TextStyle(
                                color: green,
                                fontSize: 13,
                                fontFamily:
                                "semibold",
                                fontWeight:
                                FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: height / 21,
                      width: width / 1.7,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius:
                          BorderRadius.circular(8),
                          boxShadow: [BoxShadow(offset: Offset(2, 2),color: Colors.black45,)]
                      ),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/png-transparent-whatsapp-message-icon-whatsapp-logo-whatsapp-logo-text-logo-grass-thumbnail-removebg-preview 1.png",
                            scale: 3,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "+91 7034756547",
                            style: TextStyle(
                                color: green,
                                fontSize: 13,
                                fontFamily:
                                "semibold",
                                fontWeight:
                                FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 22,),
              Container(
                height: height/1.55,
                width: width/1.1,
                decoration: BoxDecoration(
                    color: green,
                    borderRadius: BorderRadius.circular(11)
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Designer | Flutter Developer",style: TextStyle(fontFamily: "semibold",fontSize: 13,color: white),),
                        Text("Available",style: TextStyle(color: Colors.green,fontFamily: "semibold",fontSize: 11),)
                      ],
                    ),
                    SizedBox(height: 6,),
                    Divider(
                      height: 1,
                      endIndent: 18,
                      indent: 18,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 18,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundImage: AssetImage("assets/praju.jpg"),
                        ),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 200,
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Prajeesh-tp",style: TextStyle(fontFamily: "montserratmedium",fontSize: 14,color: white),),
                                  // SizedBox(width: 29,),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Icon(Icons.favorite,color: Colors.red,size: 28,),
                                  )
                                ],
                              ),
                            ),
                            Text("1 Year experience",style: TextStyle(fontFamily: "montserratmedium",fontSize: 12,color: white),),
                            Text("21 age",style: TextStyle(fontFamily: "montserratmedium",fontSize: 12,color: white),),
                            Row(
                              children: [
                                // Icon(Icons.location_on,color: white,size: 18),
                                Text("Perinthalmanna-Cherukara",style: TextStyle(fontFamily: "montserratmedium",fontSize: 12,color: white),),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.star,color: Colors.orange,size: 12,),
                                Icon(Icons.star,color: Colors.orange,size: 12,),
                                Icon(Icons.star,color: Colors.orange,size: 12,),
                                Icon(Icons.star,color: Colors.orange,size: 12,),
                                Icon(Icons.star,color: Colors.orange,size: 12,),
                                Text("5.0",style: TextStyle(color: Colors.orange,fontSize: 10),)
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 22,),
                    Padding(
                      padding: const EdgeInsets.only(right: 160),
                      child: Text("Work Related Photos :",style: TextStyle(fontSize: 11,fontFamily: "montserratmedium",color: white,),),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 85,
                          width: 85,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.asset("assets/prajoooosh.jpg",fit: BoxFit.cover,)),
                        ),
                        Container(
                            height: 85,
                            width: 85,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.asset("assets/prajooooooooooooooooooo.jpg",fit: BoxFit.cover,))
                        ),
                        Container(
                            height: 85,
                            width: 85,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.asset("assets/pra.jpg",fit: BoxFit.cover,))
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Container(
                      height: height / 21,
                      width: width / 1.7,
                      decoration: BoxDecoration(
                          color:white,
                          borderRadius:
                          BorderRadius.circular(8),
                          boxShadow: [BoxShadow(offset: Offset(2, 2),color: Colors.black45,)]
                      ),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.phone,
                            color: green,
                            size: 19,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "+91 7034756547",
                            style: TextStyle(
                                color: green,
                                fontSize: 13,
                                fontFamily:
                                "semibold",
                                fontWeight:
                                FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: height / 21,
                      width: width / 1.7,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius:
                          BorderRadius.circular(8),
                          boxShadow: [BoxShadow(offset: Offset(2, 2),color: Colors.black45,)]
                      ),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/png-transparent-whatsapp-message-icon-whatsapp-logo-whatsapp-logo-text-logo-grass-thumbnail-removebg-preview 1.png",
                            scale: 3,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "+91 7034756547",
                            style: TextStyle(
                                color: green,
                                fontSize: 13,
                                fontFamily:
                                "semibold",
                                fontWeight:
                                FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
     )
    )
    );
    
     
  }
}
