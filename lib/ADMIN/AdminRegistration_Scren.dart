import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thzhilali/ADMIN/AdminHomeScreen.dart';
import 'package:thzhilali/ADMIN/ApproveRGSTR_Screen.dart';
import 'package:thzhilali/PROVIDER/homeprovider.dart';

import '../CONSTANTS/my colors.dart';
import '../CONSTANTS/my widget.dart';

class AdminRegistration extends StatelessWidget {
  const AdminRegistration({super.key});

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
                "Registration",
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
                child:
                      // searchbar(TextInputType.text, green, "Search your Worker", Colors.grey, Icons.search, 20, height/17, width/1.13),
                      Consumer<HomeProvider>(
                        builder: (context,value,child) {
                          return ListView.builder(
                            itemCount: value.RegistrationList.length,
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder:(context, index) {
                              print("sjfshgf"+value.RegistrationList.length.toString());
                              var item=value.RegistrationList[index];
                             return   InkWell(
                               onTap: () {
                                 Navigator.push(context, MaterialPageRoute(builder: (context) => ApproveRegistration(Name: item.name,age: item.Age,Experience: item.Experience,
                                 Location: item.Location,Mainimage: item.Image,Mobilenmbr: item.Phonenmbr,whatsappnmbr:item.Whatsappnmbr,Workerimage:item.WorkerImage,Worktype: item.Jobtype,id:item.id,),));
                               },
                               child: Container(
                                 margin: EdgeInsets.symmetric(horizontal: 13,vertical: 10),
                                 height: height / 5,
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
                                           value.RegistrationList[index].Jobtype,
                                           // "Designer | Flutter Developer",
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
                                         Consumer<HomeProvider>(
                                           builder: (context,value,child) {
                                             return CircleAvatar(
                                               radius: 31,
                                               backgroundImage: NetworkImage(value.RegistrationList[index].Image),
                                             );
                                           }
                                         ),
                                         Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             SizedBox(
                                               width: width/1.8,
                                               child: Row(
                                                 mainAxisAlignment:
                                                 MainAxisAlignment.spaceBetween,
                                                 children: [
                                                   Text(
                                                     value.RegistrationList[index].name,
                                                     // "Rahul-Np",
                                                     style: TextStyle(
                                                         fontFamily: "montserratmedium",
                                                         fontSize: 16,
                                                         color: white),
                                                   ),
                                                   // SizedBox(width: 29,),
                                                   Padding(
                                                     padding: const EdgeInsets.only(right: 14),
                                                     child: Icon(
                                                       Icons.favorite,
                                                       color: white,
                                                       size: 28,
                                                     ),
                                                   )
                                                 ],
                                               ),
                                             ),
                                           ],
                                         )
                                       ],
                                     ),
                                   ],
                                 ),
                               ),
                             );
                            },

                          );
                        }
                      ),

            )
        )
    );
  }
}


















