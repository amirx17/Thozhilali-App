import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thzhilali/ADMIN/AddCategoriesScreeen.dart';
import 'package:thzhilali/ADMIN/AdminHomeScreen.dart';
import 'package:thzhilali/PROVIDER/homeprovider.dart';


import '../CONSTANTS/my colors.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

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
            value.Categoryclear();
              Navigator.push(context, MaterialPageRoute(builder: (context) => Adddcategories(from: "NEW",oldid: "",),));
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
              "Categories",
              style:
                  TextStyle(fontSize: 18, fontFamily: "semibold", color: white),
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
            physics: ScrollPhysics(),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                    child: Consumer<HomeProvider>(builder: (context, value, child) {
                  return Consumer<HomeProvider>(
                    builder: (context,value,child) {
                      return
                      value.getcategorylodder?Center(child: CircularProgressIndicator(color: green,)):
                        SizedBox(
                        height: height/1.22,
                        child: GridView.builder(
                          physics: AlwaysScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 28,
                              mainAxisSpacing: 8,
                              mainAxisExtent: 150,
                              crossAxisCount: 2),
                          itemCount: value.categorylist.length,

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
                                                  value.Deletetcategory(
                                                      value.categorylist[index].id,context);
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
                                                  value.Editcategory(
                                                      value.categorylist[index].id);
                                                  Navigator.pop(context);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            Adddcategories(
                                                                from: "EDIT",
                                                                oldid: value.categorylist[index].id
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
                              child: SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey,
                                            offset: Offset(1, 5),
                                            blurRadius: 10)
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: NetworkImage(value.categorylist[index].image),
                                          fit: BoxFit.cover),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 100),
                                      child: Container(
                                        height: 60,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            color: green.withOpacity(0.65),
                                            borderRadius: BorderRadius.only(
                                                bottomRight: Radius.circular(10),
                                                bottomLeft: Radius.circular(10))),
                                        child: Center(
                                            child: Column(
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              value.categorylist[index].text,
                                              style: TextStyle(
                                                  color: white,
                                                  fontFamily: "montserrtbold",
                                                  fontSize: 11),
                                            ),
                                            Center(
                                                child: Text(
                                              value.clicktext[index],
                                              style: TextStyle(
                                                color: white,
                                                fontSize: 9,
                                              ),
                                            )),
                                          ],
                                        )),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  );
                })),
              ],
            ),
          )),
    );
  }
}
