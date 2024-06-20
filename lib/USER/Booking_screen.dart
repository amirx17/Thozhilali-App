import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thzhilali/CONSTANTS/my%20colors.dart';
import 'package:thzhilali/PROVIDER/mainprovider.dart';
import 'package:thzhilali/USER/Bottom_screen.dart';
import 'package:thzhilali/USER/Home_Screen.dart';

import '../PROVIDER/homeprovider.dart';

class Booking_screen extends StatelessWidget {
  const Booking_screen({super.key});

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
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => Bottombar(),
                  //     )
                  // );
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: white,
                  size: 19,
                )),
            centerTitle: true,
            title: Text(
              "My Bookings",
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
                                padding: const EdgeInsets.only(left: 10,top: 7),
                                child: Row(
                                  children: [
                                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(value.bookingtext[index],style: TextStyle(fontSize: 13,color: white,fontFamily: " montserratmedium"),),
                                        Text(value.bookintwo[index],style: TextStyle(fontSize: 11,color: Colors.grey,fontFamily: " montserratmedium"),),
                                        SizedBox(height: 5,),
                                        Text(value.bottomtime[index],style: TextStyle(fontSize: 9,color: Colors.grey,fontFamily: " montserratmedium"))
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 138,top: 22),
                                      child: Text(value.booking[index],style: TextStyle(fontSize: 11,color: Colors.green,fontFamily: "semibold")),
                                    )
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
