import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:thzhilali/PROVIDER/homeprovider.dart';

import '../CONSTANTS/my colors.dart';

class Editworkprofile extends StatelessWidget {
  const Editworkprofile({super.key});

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
                  onTap: () {},
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: white,
                    size: 19,
                  )),
              centerTitle: true,
              title: Text(
                "Work Profile",
                style: TextStyle(
                    fontSize: 16, fontFamily: "semibold", color: white),
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
           child: Consumer<HomeProvider>(
             builder: (context,value,child) {
               print("fghjk"+value.RegistrationList.length.toString());
               return ListView.builder(
                  itemCount:value.RegistrationList.length,
                 scrollDirection: Axis.vertical,
                 physics:ScrollPhysics(),
                 shrinkWrap: true,
                 itemBuilder: (context, index) {
                 return Center(
                   child: Padding(
                     padding: const EdgeInsets.only(top: 40),

                     child: Container(
                     height: height/3.3,
                       width: width/1.12,
                        decoration: BoxDecoration(
                          color:green,
                              borderRadius:BorderRadius.circular(20)
                        ),
                        child: Center(child: Column(
                          children: [
                            SizedBox(height: 10,),
                            CircleAvatar(
                             radius: 35,
                            // / backgroundColor: Colors.green,
                             backgroundImage: NetworkImage(value.RegistrationList[index].Image),
                            ),
                            SizedBox(height: 15,),
                            Text(value.RegistrationList[index].name,style: TextStyle(color: Colors.white),),
                            Text(value.RegistrationList[index].Location,style: TextStyle(color: Colors.white,)),
                            Padding(
                              padding: const EdgeInsets.only(top: 12,left: 190),
                              child: Container(
                              height: height/21,
                              width: width/4,
                              decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [BoxShadow(color: Colors.black26,offset: Offset(5, 5),blurRadius: 10)]
                              ),
                                child: Center(
                                  child: Text("Edit",style: TextStyle(
                                    color: Colors.white70,fontSize: 14,
                                  ),),
                                ),
                              ),
                            ),
                          ]
                        )),
                     ),
                   ),
                 );
               },);
             }
           ),
        ),
    );
  }
}
