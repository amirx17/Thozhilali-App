import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thzhilali/PROVIDER/homeprovider.dart';
import 'package:thzhilali/USER/Home_Screen.dart';
import 'package:thzhilali/USER/Workers_Screen.dart';

import '../CONSTANTS/my colors.dart';
import 'Bottom_screen.dart';

class jobtype extends StatelessWidget {
  String userid;
  String name;
  String phnnumber;
  String address;
  String categoryid;
   jobtype({super.key,required this.categoryid,required this.userid,required this.name,required this.phnnumber,required this.address});

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
                          builder: (context) => home(userid:userid,name: name,phnnumber: phnnumber,address: phnnumber,),
                        ));
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: white,
                    size: 19,
                  )),
              centerTitle: true,
              title: Consumer<HomeProvider>(
                builder: (context,value,child) {
                  // value.UsergetWorkerRegistration();
                  return GestureDetector(
                     onTap: () {

                       Navigator.push(context, MaterialPageRoute(builder: (context) => Workers(),));
                     },
                    child: Text(
                      "Select Job Type",
                      style: TextStyle(
                          fontSize: 16, fontFamily: "semibold", color: white),
                    ),
                  );
                }
              ),
            )),
        body: Scrollbar(
          // thumbVisibility: true,
          // interactive: true,
          // thickness: 20,
          // radius: Radius.circular(20),
          child: Container(
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
                          itemCount: value.Subcategorylistuser.length,
                          scrollDirection: Axis.vertical,
                          physics:ScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 18),
                              child: InkWell(
                                onTap: (){

                                  value.changeColors(index);

                                   value.UsergetWorkerRegistrationSelected(value.Subcategorylistuser[index].text,value.mainLocation);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Workers(),));

                                },
                                child:Container(
                                  height: height/16,
                                  width: width/1,
                                  decoration: BoxDecoration(
                                      color:value.Subcategorylistuser[index].changecolor==true?Colors.green:green,
                                      borderRadius: BorderRadius.circular(10),
                                    boxShadow:[
                                      BoxShadow(
                                        color: Colors.black,
                                        offset: Offset(0,5),
                                        blurStyle: BlurStyle.inner,
                                        blurRadius: 8
                                      )
                                    ]
                                  ),
                                  child: Center(child: Text(value.Subcategorylistuser[index].text,style: TextStyle(color: Colors.white,fontFamily: "montserratmedium"),)),

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
          ),
        )
    );

  }
}
