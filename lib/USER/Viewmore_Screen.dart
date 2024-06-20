import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thzhilali/PROVIDER/homeprovider.dart';
import 'package:thzhilali/USER/Workers_Screen.dart';

import '../CONSTANTS/my colors.dart';
import 'Jobtype_Screen.dart';

class viewmore extends StatelessWidget {

  String id;
  String Mainimage;
  String Name;
  String Experience;
  String age;
  String Location;
  List<dynamic> Workerimage;
  String whatsappnmbr;
  String Mobilenmbr;
  String Worktype;

  viewmore({super.key,required this.Mainimage,required this.Name,required this.Experience,
    required this.age,required this.Location,required this.Workerimage,required this.whatsappnmbr,
    required this.Mobilenmbr,required this.Worktype,required this.id});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Scaffold(
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
                        builder: (context) =>Workers (),
                      ));
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: white,
                  size: 19,
                )),
            centerTitle: true,
            title: Text(
              "View More",
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
                height: 22,
              ),
              Container(
                height: height / 1.55,
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
                          Worktype,
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
                          radius: 45,
                          backgroundImage: NetworkImage(Mainimage),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 200,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    Name,
                                    style: TextStyle(
                                        fontFamily: "montserratmedium",
                                        fontSize: 14,
                                        color: white),
                                  ),
                                  // SizedBox(width: 29,),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Icon(
                                      Icons.favorite,
                                      color: white,
                                      size: 28,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Text(
                            "${Experience} Yr Experience",
                              style: TextStyle(
                                  fontFamily: "montserratmedium",
                                  fontSize: 12,
                                  color: white),
                            ),
                            Text(
                                "${age} yr old",
                              style: TextStyle(
                                  fontFamily: "montserratmedium",
                                  fontSize: 12,
                                  color: white),
                            ),
                            Row(
                              children: [
                                // Icon(Icons.location_on,color: white,size: 18),
                                Text(
                                  Location,
                                  style: TextStyle(
                                      fontFamily: "montserratmedium",
                                      fontSize: 12,
                                      color: white),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 12,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 12,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 12,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 12,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 12,
                                ),
                                Text(
                                  "5.0",
                                  style: TextStyle(
                                      color: Colors.orange, fontSize: 10),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 160),
                      child: Text(
                        "Work Related Photos :",
                        style: TextStyle(
                          fontSize: 11,
                          fontFamily: "montserratmedium",
                          color: white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                      Container(
                          height: 85,
                          width: 85,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                Workerimage[0] ,
                                fit: BoxFit.cover,
                              )),
                        ),
                        Container(
                            height: 85,
                            width: 85,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  Workerimage[1] ,
                                  fit: BoxFit.cover,
                                ))),
                        Container(
                            height: 85,
                            width: 85,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child:Image.network(
                                  Workerimage[2] ,
                                  fit: BoxFit.cover,
                                ))),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Consumer<HomeProvider>(
                      builder: (context,value,child) {

                        return InkWell(
                          onTap: () {
                            value.makingPhoneCall(Mobilenmbr);
                          },
                          child: Container(
                            height: height / 21,
                            width: width / 1.7,
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(2, 2),
                                    color: Colors.black45,
                                  )
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                  Mobilenmbr,
                                  style: TextStyle(
                                      color: green,
                                      fontSize: 13,
                                      fontFamily: "semibold",
                                      fontWeight: FontWeight.w700),
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
                            value.whatsappLaunch(number:whatsappnmbr, message: "hi labor", );
                          },
                          child: Container(
                            height: height / 21,
                            width: width / 1.7,
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(2, 2),
                                    color: Colors.black45,
                                  )
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/png-transparent-whatsapp-message-icon-whatsapp-logo-whatsapp-logo-text-logo-grass-thumbnail-removebg-preview 1.png",
                                  scale: 3,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                 whatsappnmbr,
                                  style: TextStyle(
                                      color: green,
                                      fontSize: 13,
                                      fontFamily: "semibold",
                                      fontWeight: FontWeight.w700),
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
            ],
          ),
        ),
      ),
    );
  }
}
