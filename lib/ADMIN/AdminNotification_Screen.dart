import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thzhilali/ADMIN/AddNotificationScreen.dart';
import 'package:thzhilali/ADMIN/AdminHomeScreen.dart';
import 'package:thzhilali/PROVIDER/homeprovider.dart';

import '../CONSTANTS/my colors.dart';


class AdminNoti extends StatelessWidget {
  const AdminNoti({super.key});

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor:green,
      floatingActionButton:  FloatingActionButton(backgroundColor: Colors.green,
        shape: CircleBorder(
        ),
        child: Icon(Icons.add,color: white,size: 30,),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddNotification(),));
        },),
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
              "Notifications",
              style: TextStyle(
                  fontSize: 17, fontFamily: "semibold", color: white),
            ),
          )),
      body: SingleChildScrollView(
        //physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: height,
              width: width / 1,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child:
              Padding(
                padding: const EdgeInsets.only(top: 28,right:15,left: 15),
                child: Consumer<HomeProvider>(
                    builder: (context,value,child) {
                      return GridView.builder(
                        shrinkWrap: true,
                        itemCount: value.bookingtext.length,
                        padding: EdgeInsets.symmetric(),
                        //physics: ScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 5,
                        ), itemBuilder: (context, index) {
                        return Container(
                          height: height/12,
                          width: width,
                          decoration: BoxDecoration(
                              color: green,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10,top: 5),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(value.notitext[index],style: TextStyle(fontSize: 13,color: white,fontFamily: " montserratmedium"),),
                                Text(value.secondtext[index],style: TextStyle(fontSize: 11,color: Colors.grey,fontFamily: " montserratmedium"),),
                                SizedBox(height: 7,),
                                Text(value.notitime[index],style: TextStyle(fontSize: 9,color: Colors.grey,fontFamily: " montserratmedium"))
                              ],
                            ),
                          ),
                        );
                      },);
                    }
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
