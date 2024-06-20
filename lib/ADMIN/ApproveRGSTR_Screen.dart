import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thzhilali/ADMIN/AdminRegistration_Scren.dart';
import 'package:thzhilali/CONSTANTS/my%20colors.dart';
import 'package:thzhilali/CONSTANTS/my%20widget.dart';
import 'package:thzhilali/PROVIDER/homeprovider.dart';

import 'AdminHomeScreen.dart';

class ApproveRegistration extends StatelessWidget {
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

  ApproveRegistration(
      {super.key,
      required this.Mainimage,
      required this.Name,
      required this.Experience,
      required this.age,
      required this.Location,
      required this.Workerimage,
      required this.whatsappnmbr,
      required this.Mobilenmbr,
      required this.Worktype,
      required this.id});

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
                          builder: (context) => AdminRegistration(),
                        ));
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: white,
                    size: 19,
                  )),
              centerTitle: true,
              title: Text(
                "Registration Approve",
                style: TextStyle(
                    fontSize: 17, fontFamily: "semibold", color: white),
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
                  height: height / 24,
                ),
                CircleAvatar(
                  radius: 45,
                  backgroundImage: NetworkImage(Mainimage),
                ),
                SizedBox(
                  height: height / 19,
                ),
                register(height / 15, width / 1.1, green, 10, Name),
                register(height / 15, width / 1.1, green, 10, Experience),
                register(height / 15, width / 1.1, green, 10, age),
                register(height / 15, width / 1.1, green, 10, Location),
                Center(
                  child: Text(
                    "Work Related Photos :",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "montserratmedium",
                      color: green,
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
                            Workerimage[0],
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
                              Workerimage[1],
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
                            child: Image.network(
                              Workerimage[2],
                              fit: BoxFit.cover,
                            ))),
                  ],
                ),
                SizedBox(
                  height: height / 22,
                ),
                register(height / 15, width / 1.1, green, 10, Mobilenmbr),
                register(height / 15, width / 1.1, green, 10, whatsappnmbr),
                register(height / 15, width / 1.1, green, 10, Worktype),
                SizedBox(
                  height: height / 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Consumer<HomeProvider>(builder: (context, value, child) {
                      return InkWell(
                          onTap: () {
                            value.WorkerAccept(id, "APPROVED", context);
                          },
                          child: add(height / 14, width / 2.5, 15, "Accept"));
                    }),
                    Consumer<HomeProvider>(builder: (context, value, child) {
                      return InkWell(
                          onTap: () {
                            value.WorkerAccept(id, "REJECT", context);
                          },
                          child: sad(height / 14, width / 2.5, 15, "Reject"));
                    }),
                    // sad(height/14, width/2.5,  15, "Reject"),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ));
  }
}
