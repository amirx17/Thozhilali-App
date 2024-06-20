import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:thzhilali/ADMIN/AdminHomeScreen.dart';
import 'package:thzhilali/CONSTANTS/my%20colors.dart';
import 'package:thzhilali/PROVIDER/homeprovider.dart';


import 'addsubcategory.dart';

class AdminSubCategory extends StatelessWidget {
  const AdminSubCategory({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: green,
        floatingActionButton:  Consumer<HomeProvider>(
            builder: (context,value,child) {
            return FloatingActionButton(backgroundColor: Colors.green,
              shape: CircleBorder(
              ),
              child: Icon(Icons.add,color: white,size: 30,),
              onPressed: () {
                value.getCategory();
                Navigator.push(context, MaterialPageRoute(builder: (context) => subcategory(from: "NEW",oldid: "",),));
              },);
          }
        ),
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
                "Sub Categories",
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
                      return
                      value.Getsubcatlodder?Center(child: CircularProgressIndicator(color: green,)):
                        ListView.builder(
                        itemCount: value.Subcategorylist.length,
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
    showDialog(
    context: context,
    builder: (context) => AlertDialog(
    content:  Text(
    "Do you want to  EDIT or DELETE ?",style: TextStyle(
    fontSize:17,
    fontWeight: FontWeight.w600,
    color: Colors.black)),
    actions: <Widget>[
    Center(
    child: Row(
    children: [
    TextButton(
    onPressed: () {
    value.Deletesubcategory(
    value.Subcategorylist[index].id,context);
    Navigator.of(context).pop();

    },
    child: Container(
    height: 45,
    width: 90,
    decoration: BoxDecoration(
    color:Colors.red ,
    borderRadius: BorderRadius.circular(8),
    boxShadow: [
    BoxShadow(
    color: Color(0x26000000),
    blurRadius: 2.0, // soften the shadow
    spreadRadius: 1.0, //extend the shadow
    ),
    ] ),
    child: Center(child:  Text("Delete",style: TextStyle( color:Colors.white,fontSize: 17,fontWeight: FontWeight.w700))),
    ),
    ),
    TextButton(
    onPressed: () {
    value.Editsubcategory(
    value.Subcategorylist[index].id);
    Navigator.pop(context);
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) =>
    subcategory(
    from: "EDIT",
    oldid: value.Subcategorylist[index].id
    ),
    ));
    },
    child:Container(
    height: 45,
    width: 90,
    decoration: BoxDecoration(
    color:green ,
    borderRadius: BorderRadius.circular(8),
    boxShadow: [
    BoxShadow(
    color: Color(0x26000000),
    blurRadius: 2.0, // soften the shadow
    spreadRadius: 1.0, //extend the shadow
    ),
    ] ),
    child: Center(child:  Text("Edit",style: TextStyle( color:Colors.white,fontSize: 17,fontWeight: FontWeight.w700))),
    ),)
    ],
    ),
    ),

    ],
    ),
    );
    },

                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 18),
                              child: Container(
                                height: height/16,
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
                                child: Center(child: Text(value.Subcategorylist[index].text,style: TextStyle(color: Colors.white,fontFamily: "montserratmedium"),)),
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
