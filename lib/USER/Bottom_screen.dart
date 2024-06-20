import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thzhilali/CONSTANTS/my%20colors.dart';
import 'package:thzhilali/PROVIDER/homeprovider.dart';
import 'package:thzhilali/USER/Booking_screen.dart';
import 'package:thzhilali/USER/Favourite_screen.dart';
import 'package:thzhilali/USER/Mainprofile_Screen.dart';
import 'package:thzhilali/USER/profile_screen.dart';


import 'Home_Screen.dart';
import 'Location_Screen.dart';
import 'Notification_Screen.dart';

class Bottombar extends StatefulWidget {
  String userid;
  String name;
  String phnnumber;
  String address;
  Bottombar({super.key,required this.userid,required this.name,required this.phnnumber,required this.address});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int selectedIndex = 0;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      HomeProvider provider=Provider.of<HomeProvider>(context,listen: false);
      // _showAlert(context);
      if(provider.mainLocation==""){
        locationAlert(context);}
    });
  }

// @override
  // void initState() {
  // // HomeProvider provider=Provider.of<HomeProvider>(context,listen: false);
  // //
  // // if(provider.mainLocation==""){
  // //    locationAlert(context);}
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  void _itemTapped(int index){
    setState(() {
      selectedIndex = index;
      // print(selectedIndex.toString()+"ppkk");
    });

  }



  @override
  Widget build(BuildContext context) {






    var pages = [
      home(userid:widget.userid ,name: widget.name,phnnumber:  widget.phnnumber,address: widget.address,),
      Favourite_screen(),
      notification_Screeen(),
      Mainprofile(userid: widget.userid,name: widget.name, phnnumber: widget.phnnumber,address: widget.address,),
    ];

    return Scaffold(
        body: pages[selectedIndex],

        extendBody: true,
        bottomNavigationBar:  DotNavigationBar(
          margin: EdgeInsets.zero,marginR: EdgeInsets.zero,paddingR: EdgeInsets.zero,
          // enableFloatingNavBar: true,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          backgroundColor: green.withOpacity(0.90),
          currentIndex: selectedIndex,

          onTap: _itemTapped,
          items: [
            DotNavigationBarItem(
              icon: Icon(Icons.home_filled),
            ),
            // DotNavigationBarItem(
            //   icon: Icon(Icons.edit_calendar),
            //
            // ),

            DotNavigationBarItem(
              icon: Icon(Icons.favorite),),
            DotNavigationBarItem(
              icon: Icon(Icons.notifications),),
            DotNavigationBarItem(

              icon: Icon(Icons.person),

            ),

          ],
        ),
        );
    }

  locationAlert(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Center(
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor:Colors.green,
                radius: 30,
                child: Icon(Icons.location_on,color: Colors.white,size: 33,),
              ),
              SizedBox(height: 10,),
              const Text("Enable your location",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "semibold",
                    color: Colors.black,
                  )),
            ],
          ),
        ),
        contentPadding: EdgeInsets.zero,
        backgroundColor: Colors.white,
        content: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            height: MediaQuery.of(context).size.height/ 2.7,
            width: MediaQuery.of(context).size.width/1.2,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.circular(30)),
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Text("Choose your location to start find the",style: TextStyle(color: Colors.grey),),
                Center(child: Text("request around you",style: TextStyle(color: Colors.grey),)),
                SizedBox(height:  MediaQuery.of(context).size.height/ 12,),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Location_Screen(userid: widget.userid,name:widget.name ,phnnumber: widget.phnnumber ,address: widget.address,),));
                  },
                  child: Container(
                    height:  MediaQuery.of(context).size.height/ 12,
                    width:  MediaQuery.of(context).size.width/ 1.5,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [Colors.green,Colors.blue]),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text("Use My Location",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
