import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thzhilali/ADMIN/AdminHomeScreen.dart';
import 'package:thzhilali/PROVIDER/homeprovider.dart';

import '../CONSTANTS/my colors.dart';


class Userlist extends StatelessWidget {
  const Userlist({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Scaffold(
        backgroundColor:green,
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
    "User List",
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
            SizedBox(height: 20,),
            SizedBox(
              height: height/1,
              width: width/1.1,
              child: Consumer<HomeProvider>(
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: value.Signuplist.length,
                    scrollDirection: Axis.vertical,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,

                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 18),
                        child: Container(
                          height: height/6.8,
                          width: width/1.1,
                          decoration: BoxDecoration(
                              color: green,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow:[
                                BoxShadow(
                                    color: Colors.black38,
                                    offset: Offset(4, 4),
                                    blurRadius: 10
                                )
                              ]
                          ),
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(value.Signuplist[index].Name,style: TextStyle(color: Colors.white,),),
                                 SizedBox(height: 6,),
                                 Text(value.Signuplist[index].Address,style: TextStyle(color: Colors.white,),),
                                 SizedBox(height: 6,),
                                 Text(value.Signuplist[index].Phone,style: TextStyle(color: Colors.white,),),
                               ],
                             ),
                           ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    )
    );
  }
}
