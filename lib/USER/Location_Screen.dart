import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thzhilali/CONSTANTS/my%20widget.dart';
import 'package:thzhilali/PROVIDER/homeprovider.dart';

import '../CONSTANTS/my colors.dart';
import 'Bottom_screen.dart';

class Location_Screen extends StatelessWidget {
  String userid;
  String name;
  String phnnumber;
  String address;
   Location_Screen({super.key,required this.userid,required this.name,required this.phnnumber,required this.address});

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
                        builder: (context) => Bottombar(
                          userid: '',
                          name: '',
                          phnnumber: '',
                          address: '',
                        ),
                      ));
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: white,
                  size: 19,
                )),
            centerTitle: true,
            title: Text(
              "Location",
              style:
                  TextStyle(fontSize: 17, fontFamily: "semibold", color: white),
            ),
          )),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(children: [
          Container(
            height: height,
            width: width / 1,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Consumer<HomeProvider>(builder: (context, val, child) {
                  return Container(
                    height: height / 14,
                    width: width / 1.1,
                    child: TextFormField(
                      controller: val.Locationcontrolller,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        val.filterItems(value);
                      },
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                        filled: true,
                        // contentPadding: const EdgeInsets.symmetric(vertical: 14),
                        hintText: "search location",

                        hintStyle: TextStyle(
                          color: Colors.black26,
                          fontSize: 12,
                        ),
                        // prefixIcon:const Icon(Icons.person,color: Colors.green,),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Name";
                        } else {
                          return null;
                        }
                      },
                    ),
                  );
                }),
                SizedBox(height: 30),
                Expanded(
                  child: Consumer<HomeProvider>(
                    builder: (context, provider, _) {
                      return ListView.builder(
                        itemCount: provider.filteredItems.length,
                        itemBuilder: (context, index) {
                          final item = provider.filteredItems[index];
                          return ListTile(
                            onTap: () {
                              provider.Locationcontrolller.text = item['name'];
                              provider.notifyListeners();
                              provider.setLocation();
                            },
                            title: Text(item['name']),
                            subtitle: Text(item['state']),
                          );
                        },
                      );
                    },
                  ),
                ),

                // Consumer<HomeProvider>(
                //   builder: (context,value,child) {
                //     return InkWell(
                //       onTap: () {
                //         value.getCurrentPosition(context);
                //       },
                //       child: Container(
                //         height: height/15,
                //         width: width/1.6,
                //         decoration: BoxDecoration(
                //           color: Colors.green,
                //           borderRadius: BorderRadius.circular(10)
                //         ),
                //         child: Center(child: Center(child: Text("Get Current Location",style: TextStyle(color: white,fontSize: 13,fontFamily: "montserratmedium",fontWeight: FontWeight.w600),))),
                //       ),
                //     );
                //   }
                // ),
              ],
            ),
          ),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          Consumer<HomeProvider>(builder: (context, val, child) {
        return InkWell(
          onTap: () {
            val.setLocation();
            Navigator.push(context, MaterialPageRoute(builder: (context) => Bottombar(userid: userid, name: name, phnnumber: phnnumber, address: address),));
          },
          child: add(height / 16, width / 3, 10, "Select"),
        );
      }),
    );
  }
}
