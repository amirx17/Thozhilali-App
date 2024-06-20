import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thzhilali/ADMIN/AdminHomeScreen.dart';
import 'package:thzhilali/CONSTANTS/my%20colors.dart';
import 'package:thzhilali/CONSTANTS/my%20widget.dart';
import 'package:thzhilali/PROVIDER/homeprovider.dart';



class Adddcategories extends StatelessWidget {
  String from;
  String oldid;
  Adddcategories({super.key,required this.from,required this.oldid});
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
                from=="EDIT"?"Edit Categories":"Add Categories",
                style: TextStyle(
                    fontSize: 18, fontFamily: "semibold", color: white),
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
                  SizedBox(height: height/9,),
                  Consumer<HomeProvider>(
                    builder: (context,value,child) {
                      return InkWell(
                        onTap: () {
                          showBottomSheet(context);
                        },
                        child:value.CAtegoryfileimg!=null? Container(
                          height: height/4,
                          width: width/2,
                          decoration: BoxDecoration(
                              color: green,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(child: Image.file(value.CAtegoryfileimg!,scale: 5,)),
                        ):value.Image!=""?Container(
                          height: height/4,
                          width: width/2,
                          decoration: BoxDecoration(
                              color: green,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(child: Image.network(value.Image,scale: 5,)),
                        ):Container(
                      height: height/4,
                      width: width/2,
                      decoration: BoxDecoration(
                      color: green,
                      borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(child: Image.asset("assets/flat-color-icons_add-image.png",scale: 5,)),
                        ));
                    }
                  ),
                  SizedBox(height: height/14,),
                  Consumer<HomeProvider>(
                    builder: (context,value,child) {
                      return registration(TextInputType.text, green, "Category name", Colors.grey,  height/12, width/1.1,value.categorynamecontroller);
                    }
                  ),
                  SizedBox(height: height/9,),
                  Center(child: Consumer<HomeProvider>(
                    builder: (context,value,child) {
                      return InkWell(
                       onTap: () {
                     final FormState? form = formkey.currentState;
                     if (form!.validate()) {
                       if (value.CAtegoryfileimg != null ||
                           value.Image1 != "") {
                         if (from == "NEW") {
                           value.addcategory(from, "");
                         } else {
                           value.addcategory(from, oldid);
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
                              value.getcategorylodder?Center(child: CircularProgressIndicator(color: green,)):
                          add(height/16, width/3,  10, from=="EDIT"?"EDIT":"Add"));
                    }
                  ))
                ],
              ),
            ),
          ),
        )
    );
  }
  void showBottomSheet(BuildContext context) {
    HomeProvider provider = Provider.of<HomeProvider>(
        context, listen: false);

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
                  title: const Text('Camera',),
                  onTap: () =>
                  {
                    provider.getImgcamera1(), Navigator.pop(context)
                  }),
              ListTile(
                  leading: Icon(Icons.photo, color: green),
                  title: const Text('Gallery',),
                  onTap: () =>
                  {
                    provider.getImggallery1(), Navigator.pop(context)
                  }),
            ],
          );
        });
  }
    // ImageSource
}
