

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:thzhilali/PROVIDER/homeprovider.dart';
import '../CONSTANTS/my colors.dart';
import '../CONSTANTS/my widget.dart';
import 'Jobtype_Screen.dart';
import 'Location_Screen.dart';
import 'Notification_Screen.dart';
import 'Registration_Screen.dart';

class home extends StatelessWidget {
  String userid;
  String name;
  String phnnumber;
  String address;
   home({super.key,required this.userid,required this.name,required this.phnnumber,required this.address});
  @override
  Widget build(BuildContext context) {
    print("hhhhh"+userid);
    print("jhjjjj"+name);
    print("qqqqq"+phnnumber);
    print("wwwww"+address);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    HomeProvider provider=Provider.of<HomeProvider>(context,listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      provider.getcarousel();
      provider.getCategory();
      });

    return Scaffold(
      backgroundColor: green,
      appBar: AppBar(
        leadingWidth: width/3,
        backgroundColor: green,
        leading: Consumer<HomeProvider>(
          builder: (context,value,child) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Location_Screen(userid: userid,name: name,phnnumber: phnnumber,address: address,),
                    ));
              },
              child: Column(
                children: [
                  SizedBox(height: height/69,),
                  Icon(
                    Icons.location_on_outlined,
                    size: 24,
                    color: white,
                  ),
                  value.mainLocation.isNotEmpty? Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(  value.mainLocation,style: TextStyle(color: Colors.white,fontSize: 12),),
                  ):SizedBox(),
                ],
              ),
            );
          }
        ),
        actions: [
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Center(
                    child: const Text("Help & Support",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "semibold",
                          color: Colors.white,
                        )),
                  ),
                  contentPadding: EdgeInsets.zero,
                  backgroundColor:green,
                  content: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      height: height / 4.8,
                      width: width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.circular(30)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          Consumer<HomeProvider>(
                              builder: (context,value,child) {
                                return InkWell(
                                  onTap: () {
                                    value.makingPhoneCall("+7034756547");
                                  },
                                  child: Container(
                                    height: height / 20.5,
                                    width: width / 1.5,
                                    decoration: BoxDecoration(
                                      color: green,
                                      borderRadius:
                                      BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.phone,
                                          color: white,
                                          size: 16,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "+91 7034756547",
                                          style: TextStyle(
                                              color: white,
                                              fontSize: 12,
                                              fontFamily:
                                              "semibold",
                                              fontWeight:
                                              FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Consumer<HomeProvider>(
                              builder: (context,value,child) {
                                return InkWell(
                                  onTap: () {
                                    value.whatsappLaunch(number: "7034756547", message: "hi labor", );
                                  },
                                  child: Container(
                                    height: height / 20.5,
                                    width: width / 1.5,
                                    decoration: BoxDecoration(
                                      color: green,
                                      borderRadius:
                                      BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/png-transparent-whatsapp-message-icon-whatsapp-logo-whatsapp-logo-text-logo-grass-thumbnail-removebg-preview 1.png",
                                          scale: 4,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "+91 7034756547",
                                          style: TextStyle(
                                              color: white,
                                              fontSize: 12,
                                              fontFamily:
                                              "semibold",
                                              fontWeight:
                                              FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            child: SizedBox(
              width: width/6,
              child: Icon(
                Icons.help,
                size: 22,
                color: white,
              ),
            ),
          ),
        ],
      ),
      body:  SingleChildScrollView(
          child: Column(
            children: [
              Consumer<HomeProvider>(builder: (context, value, child) {
                  return Column(
                    children: [

                      // Padding(
                      //   padding:
                      //       EdgeInsets.only(left: height / 36, top: height / 18),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //
                      //
                      //
                      //       SizedBox(
                      //         // width: width / 26,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: height / 36,
                      // ),
                      SizedBox(
                        height: height / 38,
                      ),
                      searchbar((TextInputType.text), white, "Search", Colors.grey,
                          Icons.search, 19, height / 19.5, width / 1.13,value.searchCategory),
                      SizedBox(
                        height: height / 36,
                      ),
                      Consumer<HomeProvider>(builder: (context, value, child) {
                        print("dskmdskooi");
                        return value.carouselist.isNotEmpty
                            ?CarouselSlider.builder(
                          itemCount: value.carouselist.length,
                          itemBuilder: (context, index, realIndex) {
                            return GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (_) => new AlertDialog(
                                          contentPadding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0))),
                                          content:
                                              Image.network(value.carouselist[index].image),
                                        ));
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  width: width/1.1,
                                  height: 190,
                                  child: Image.network(
                                    value.carouselist[index].image.toString(),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            );
                          },
                          options: CarouselOptions(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              height: height / 3.8,
                              viewportFraction: 1,
                              autoPlay: true,
                              pageSnapping: true,
                              enlargeStrategy: CenterPageEnlargeStrategy.height,
                              enlargeCenterPage: true,
                              autoPlayInterval: const Duration(seconds: 3),
                              onPageChanged: (index, reason) {
                                value.Activeindex(index);
                                value.notifyListeners();
                              }),
                        )
                            :SizedBox();
                      }),
                      buildIndiCator(
                          value.carouselist.length, context, value.activeindex),
                    ],
                  );
                }
              ),
              SizedBox(
                height: 15,
              ),
              Consumer<HomeProvider>(
                builder: (context,value,child) {
                  return Container(
                    height: height / 1.99,
                    width: width / 1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: white,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: height / 34,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 230),
                            child: GestureDetector(
                              onTap: () {

                              },
                              child: Text(
                                "Register as :",
                                style: TextStyle(
                                    fontFamily: "montserrtbold",
                                    fontSize: 11,
                                    color: green),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height / 55,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print("jjj"+userid);
                                  value.clearRegControls();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Workersregistration(From: "WORK",userid: userid,),
                                      ));
                                },
                                child: Consumer<HomeProvider>(
                                  builder: (context,value,child) {
                                    return Container(
                                        height: height / 19,
                                        width: width / 2.5,
                                        decoration: BoxDecoration(
                                            color: green,
                                            borderRadius: BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  offset: Offset(5, 5),
                                                  blurRadius: 10)
                                            ]),
                                        child: Center(
                                            child: Text(
                                          "Worker",
                                          style: TextStyle(
                                              fontSize: 11,
                                              fontFamily: "montserrtbold",
                                              color: white),
                                        )));
                                  }
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  value.clearRegControls();
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Workersregistration(From: "",userid: userid,),));
                                },
                                child: Container(
                                    height: height / 19,
                                    width: width / 2.5,
                                    decoration: BoxDecoration(
                                        color: green,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey,
                                              offset: Offset(5, 5),
                                              blurRadius: 10)
                                        ]),
                                    child: Center(
                                        child: Text(
                                      "Contractor",
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontFamily: "montserrtbold",
                                          color: white),
                                    ))),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height / 23,
                          ),
                          Consumer<HomeProvider>(
                            builder: (context,value,child) {
                              return Container(
                                child: GridView.builder(
                                  padding: EdgeInsets.symmetric(horizontal: 25),
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisSpacing: 28,
                                          mainAxisSpacing: 8,
                                          mainAxisExtent: 150,
                                          crossAxisCount: 2),
                                  itemCount:value. Filtercategorylist.length,
                                  itemBuilder: (context, index) {
                                    return SizedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 5.0),
                                        child: InkWell(
                                          onTap: () {
                                            value.getSubcategoryuser(value.Filtercategorylist[index].id.toString());
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => jobtype(categoryid: value.Filtercategorylist[index].id.toString(),userid: userid,name: name,phnnumber: phnnumber,address: address,),
                                                ));
                                          },
                                          child: Container(
                                            height: 60,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey,
                                                    offset: Offset(1, 5),
                                                    blurRadius: 10)
                                              ],
                                              borderRadius: BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  image: NetworkImage(value.Filtercategorylist[index].image),
                                                  fit: BoxFit.cover),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 100),
                                              child: Container(
                                                height: 60,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                    color: green.withOpacity(0.65),
                                                    borderRadius: BorderRadius.only(
                                                        bottomRight: Radius.circular(10),
                                                        bottomLeft: Radius.circular(10))),
                                                child: Center(
                                                    child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      value.Filtercategorylist[index].text,
                                                      style: TextStyle(
                                                          color: white,
                                                          fontFamily: "montserrtbold",
                                                          fontSize: 11),
                                                    ),
                                                    Center(
                                                        child: Text(
                                                      value.clicktext[index]  ,
                                                      style: TextStyle(
                                                        color: white,
                                                        fontSize: 9,
                                                      ),
                                                    )),
                                                  ],
                                                )),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }
                          ),
                          SizedBox(
                            height: height / 12,
                          )
                        ],
                      ),
                    ),
                  );
                }
              ),
            ],
          ),
        )

    );
  }
}

buildIndiCator(int count, BuildContext context, int activeindex) {
  //    print(activeIndex.toString()+"dpddoopf");

  return Center(
    child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Consumer<HomeProvider>(builder: (context, value, child) {
          return value.carouselist.isNotEmpty?DotsIndicator(
            position: activeindex,
            dotsCount: value.carouselist.length,
            decorator: DotsDecorator(
                activeSize: Size.fromRadius(3),
                size: Size.fromRadius(3),
                activeColor: white,
                color: Colors.grey),
          ):SizedBox();
        })),
  );
}
