

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thzhilali/ADMIN/AdminHomeScreen.dart';
import 'package:thzhilali/ADMIN/AdminNotification_Screen.dart';
import 'package:thzhilali/CONSTANTS/my%20widget.dart';

import '../CONSTANTS/my colors.dart';

class AddNotification extends StatelessWidget {
  const AddNotification({super.key});

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
                          builder: (context) => AdminNoti(),
                        ));
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: white,
                    size: 19,
                  )),
              centerTitle: true,
              title: Text(
                "Add Notifications",
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
                SizedBox(height: height/9,),
                Container(
                  height: height/7,
                  width: width/1.1,
                  decoration: BoxDecoration(
                      color: green,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(child: Icon(Icons.notifications,size: 25,color: white,)),
                 ),
                SizedBox(height: height/7,),
                add(height/16, width/3, 10, "Add")
              ],
            ),
          ),
          ),
        );
    
  }
}
