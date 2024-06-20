import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thzhilali/ADMIN/AdminHomeScreen.dart';
import 'package:thzhilali/ADMIN/AdminRegistration_Scren.dart';
import 'package:thzhilali/ADMIN/Carousel_Screen.dart';
import 'package:thzhilali/CONSTANTS/my%20colors.dart';
import 'package:thzhilali/CONSTANTS/my%20widget.dart';
import 'package:thzhilali/PROVIDER/homeprovider.dart';





class Addcarousel extends StatelessWidget {
  String from;
  String oldid;
  Addcarousel({super.key, required this.from, required this.oldid});
  final formkey = GlobalKey<FormState>();
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
                        builder: (context) => Carousel(),
                      ));
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: white,
                  size: 19,
                )),
            centerTitle: true,
            title: Text(
              from == "EDIT" ? "Edit Carousel" : "Add Carousel",
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
          child: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(
                  height: height / 9,
                ),
                Consumer<HomeProvider>(builder: (context, value, child) {
                  return InkWell(
                    onTap: () {
                      showBottomSheet(context);
                    },
                    child: value.carouselFileimg != null
                        ? Container(
                            height: height / 4,
                            width: width / 1.2,
                            decoration: BoxDecoration(
                                color: green,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Image.file(
                              value.carouselFileimg!,
                              scale: 4,
                            )),
                          )
                        : value.Image != ""
                            ? Container(
                                height: height / 4,
                                width: width / 1.2,
                                decoration: BoxDecoration(
                                    color: green,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Image.network(
                                  value.Image,
                                  scale: 4,
                                )),
                              )
                            : Container(
                                height: height / 4,
                                width: width / 1.2,
                                decoration: BoxDecoration(
                                    color: green,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Image.asset(
                                  "assets/flat-color-icons_add-image.png",
                                  scale: 4,
                                )),
                              ),
                  );
                }),
                SizedBox(
                  height: height / 7,
                ),
                Consumer<HomeProvider>(builder: (context, value, child) {
                  return InkWell(
                      onTap: () {
                        final FormState? form = formkey.currentState;
                        if (form!.validate()) {
                          if (value.carouselFileimg != null ||
                              value.Image != "") {
                            if (from == "NEW") {
                              value.addcarousel(from, "");
                            } else {
                              value.addcarousel(from, oldid);
                            }
                            Navigator.pop(context);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                "Image Provided",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 20),
                              ),
                              duration: Duration(milliseconds: 3000),
                            ));
                          }
                        }
                      },

                      child:
                          value.caroucellodder?CircularProgressIndicator(color: green,):
                      Center(
                          child: add(height / 16, width / 3, 10,
                              from == "EDIT" ? "EDIT" : "Add")));
                })
              ],
            ),
          ),
        ),
      ),
    );
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
                      {provider.getImgcamera(), Navigator.pop(context)}),
              ListTile(
                  leading: Icon(Icons.photo, color: green),
                  title: const Text(
                    'Gallery',
                  ),
                  onTap: () =>
                      {provider.getImggallery(), Navigator.pop(context)}),
            ],
          );
        });
    // ImageSource
  }
}
