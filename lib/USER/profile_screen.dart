import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thzhilali/PROVIDER/homeprovider.dart';

import '../CONSTANTS/my colors.dart';
import '../CONSTANTS/my widget.dart';

import 'login_Screen.dart';

class ProfileScreen extends StatefulWidget {
  String userid;
  String Name;
  String Phonnmbr;
  String Addrss;
   ProfileScreen({super.key,required this.userid,required this.Name,required this.Addrss,required this.Phonnmbr});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => Bottombar(),
                    //     ));
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: white,
                    size: 19,
                  )),
              centerTitle: true,
              title: Text(
                "Edit Profile",
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
            child:Column(
              children: [
                SizedBox(
                  height: height / 28,
                ),
                InkWell(onTap: () {
                  showBottomSheet(context);
                },
                    child: Consumer<HomeProvider>(
                    builder: (context,value,child) {
                      print("image und");
                      return value.Customerimage!=null?CircleAvatar(
                        radius: 50,
                        // backgroundColor: green,
                       backgroundImage: FileImage(value.Customerimage!),
                      ):value.profileephoto!=""?CircleAvatar(
                        radius: 50,
                        backgroundColor: green,
                        backgroundImage: NetworkImage(value.profileephoto),

                      ):CircleAvatar(
                        radius: 50,
                        backgroundColor: green,
                        child: Icon(
                          Icons.person,
                          size: 55,
                          color: white,
                        ),
                      );
                    }
                  ),
                ),
                SizedBox(
                  height: height / 42,
                ),
                 Text("Add photo",style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500, color: green),),
                SizedBox(
                  height: height/20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 290),
                  child: Text(
                    "Name",
                    style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500, color: green),
                  ),
                ),
                SizedBox(
                  height: height / 100,
                ),
                Consumer<HomeProvider>(
                  builder: (context,value,child) {
                    print("djdjdjd"+ value.Namecontroller1.text);
                    return profile(
                        TextInputType.text,
                        green,
                        white,
                        Icons.person,
                        22,
                        height / 13,
                        width / 1.1,
                        Icons.drive_file_rename_outline,
                        22,
                        value.Namecontroller1
                    );
                  }
                ),
                SizedBox(
                  height: height / 45,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 290),
                  child: Text(
                    "Phone",
                    style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500, color: green),
                  ),
                ),
                SizedBox(
                  height: height / 100,
                ),
                Consumer<HomeProvider>(
                  builder: (context,value,child) {
                    return profilenumber(
                        TextInputType.text,
                        green,
                        white,
                        Icons.person,
                        22,
                        height / 13,
                        width / 1.1,
                        Icons.drive_file_rename_outline,
                        22,
                        value.Phonecontroller1
                    );
                  }
                ),
                SizedBox(
                  height: height / 45,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 280),
                  child: Text(
                    "Address",
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500,color: green),
                  ),
                ),
                SizedBox(
                  height: height / 100,
                ),
                Consumer<HomeProvider>(
                    builder: (context,value,child) {
                      // print("djdjdjd"+ value.Addresscontroller1.toString());
                      return profile(TextInputType.text, green, white, Icons.group_add, 22, height / 13, width / 1.1, Icons.drive_file_rename_outline, 22, value.Addresscontroller1
                      );
                    }
                ),
                //
                // SizedBox(
                //   height: height / 45,
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 230),
                //   child: Text(
                //     "Service Location",
                //     style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500,color: green),
                //   ),
                // ),
                // SizedBox(
                //   height: height / 100,
                // ),
                // profilelocation(
                //     TextInputType.text,
                //     green,
                //     "Brazil",
                //     white,
                //     Icons.location_on,
                //     22,
                //     height / 13,
                //     width / 1.1,
                //     Icons.drive_file_rename_outline,
                //     22),
                SizedBox(
                  height: height/16,
                ),
                Consumer<HomeProvider>(
                  builder: (context,value,child) {
                    return InkWell(
                      onTap: () {
                        value.Customerdetails(widget.Phonnmbr, widget.userid);

                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                         color: Colors.green,
                         borderRadius:  BorderRadius.circular(10),
                        ),
                        child: Center(child: Text("Save",style: TextStyle(color: Colors.white,fontSize: 14),)),
                      ),
                    );
                  }
                ),
                 SizedBox(height: height/12,)
              ],
            ),
          ),
        ));
  }
  void showBottomSheet(BuildContext context) {
    HomeProvider provider = Provider.of<HomeProvider>(context, listen: false);

    showModalBottomSheet(
        elevation: 10,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            )),
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
            children: <Widget>[
              ListTile(
                  leading: Icon(
                    Icons.camera_enhance_sharp,
                    color: green,
                  ),
                  title: const Text(
                    'Camera',
                  ),
                  onTap: () =>
                  {provider.getImgcamerac(), Navigator.pop(context)}),
              ListTile(
                  leading: Icon(Icons.photo, color: green),
                  title: const Text(
                    'Gallery',
                  ),
                  onTap: () =>
                  {provider.getImggalleryc(), Navigator.pop(context)}),
            ],
          );
        });
  }

}
