import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:thzhilali/CONSTANTS/my%20widget.dart';
import 'package:thzhilali/PROVIDER/homeprovider.dart';
import 'package:thzhilali/PROVIDER/mainprovider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../CONSTANTS/my colors.dart';
import '../modelclass/modelclass.dart';
import 'Bottom_screen.dart';
import 'Registration_Screen.dart';
import 'Registration_Screen.dart';
import 'Registration_Screen.dart';
import 'Registration_Screen.dart';
import 'Workerlocation_Screen.dart';

class Workersregistration extends StatelessWidget {
  String From;
  String userid;
   Workersregistration({super.key,required this.From,required this.userid});
   final formkey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print("dkhvch"+userid);
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
                          builder: (context) => Bottombar(userid: '', name: '', phnnumber: '', address: '',),
                        ));
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: white,
                    size: 19,
                  )),
              centerTitle: true,
              title: Text(
             From== "WORK"?"Workers Registration":"Contractor Registration",
                style: TextStyle(
                    fontSize: 16, fontFamily: "semibold", color: white),
              ),
            )),
        body: Container(
          width: width / 1,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30)),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                children: [
                SizedBox(
                height: height / 28,
              ),
                  InkWell(onTap: () {
                    showBottomSheet1(context);
                  },
                    child: Consumer<HomeProvider>(
                        builder: (context,value,child) {
                          print("image und");
                          return value.Registerfileimage!=null?CircleAvatar(
                            radius: 50,
                            // backgroundColor: green,
                            backgroundImage: FileImage(value.Registerfileimage!),
                          ):value.Registerimg!=""?CircleAvatar(
                            radius: 50,
                            backgroundColor: green,
                            backgroundImage: NetworkImage(value.Registerimg),

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
                  SizedBox(height: 10,),
                  Text("Add photo",style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500, color: green),),
                   SizedBox(height: 15,),
                    Consumer<HomeProvider>(
                      builder: (context,value,child) {
                        return registration(TextInputType.text, green, "Enter Name", Colors.grey,  height/14, width/1.1,value.Namecontroller2);
                      }
                    ),
                  Consumer<HomeProvider>(
                      builder: (context,value,child) {
                      return registration(TextInputType.text, green, "Enter Work Experience", Colors.grey,  height/14, width/1.1,value.Experiencecontroller);
                    }
                  ),
                  Consumer<HomeProvider>(
                      builder: (context,value,child) {
                       return registration(TextInputType.text, green, "Enter Age", Colors.grey,  height/14, width/1.1,value.Agecontroller);
                     }
                   ),
                  SizedBox(height: 15,),
                Consumer<HomeProvider>(
                    builder: (context,val,child) {
                      return SizedBox(
                        height: height/14,
                        width: width/1.1,
                        child: TextFormField(
                          onTap: (){
                            print("single taaaaaaaap");
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>WorkerLocation() ,));
                          },
                          style: const TextStyle(color: Colors.white),
                          // enabled: false,
                          controller: val.Locationcontroller1,
                          textAlign: TextAlign.left,
                          onChanged: (value) {
                            val.filterItems1(value);
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                            filled: true,
                            fillColor: green,
                            // contentPadding: const EdgeInsets.symmetric(vertical: 14),
                            hintText: "Enter location",

                            hintStyle: TextStyle(
                              color: Colors.grey,
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
                                borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter location";
                            } else {
                              return null;
                            }
                          },
                        ),
                      );
                    }
                ),
                SizedBox(height:30),

              // child: locationText(TextInputType.text, green, "Enter Location", Colors.grey,  height/14, width/1.1,value.Locationcotroller));

                        SizedBox(height: 10,),
                  Text("Add three work related photos :",style: TextStyle(color: green,fontFamily: "semibold",fontSize: 10),),
                   SizedBox(height: 20,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Text("Photo:1",style: TextStyle(color: green,fontFamily: "semibold",fontSize: 11),),
                      // Text("Photo:2",style: TextStyle(color: green,fontFamily: "semibold",fontSize: 11),),
                      // Text("Photo:3",style: TextStyle(color: green,fontFamily: "semibold",fontSize: 11),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Consumer<HomeProvider>(
                      builder: (context,value,child) {
                        return value.Workerlist.isNotEmpty?
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(

                                children: List.generate(value.Workerlist.length,(Index){
                                  return Container(
                                    margin: EdgeInsets.only(right: 3),
                                    height: height/7.2,
                                    width: width/4,
                                    decoration: BoxDecoration(
                                      color: green,
                                      borderRadius: BorderRadius.circular(12),
                                      // border: Border.all(strokeAlign: BorderSide.strokeAlignOutside,color: Colors.grey),
                                      image:DecorationImage(image: FileImage(value.Workerlist[Index]),fit: BoxFit.cover) ,
                                    ),

                                  );
                                },
                                )
                            ),
                            value.Workerlist.length<3?GestureDetector(
                              onTap: () {

                                showBottomSheet2(context,);
                              },
                              child: Container(
                                height: height/7.2,
                                width: width/4,
                                decoration: BoxDecoration(
                                  color: green,
                                  borderRadius: BorderRadius.circular(12),
                                  // border: Border.all(strokeAlign: BorderSide.strokeAlignOutside,color: Colors.grey),
                                ),
                                child: Center(child: Icon(Icons.add,color: Colors.white,size: 35,)),),
                            )
                                :const SizedBox()
                          ],
                        )
                            :GestureDetector(
                          onTap: () {

                            showBottomSheet2(context,);
                          },
                              child: Container(
                                height: height/7.2,
                                width: width/4,
                                decoration: BoxDecoration(
                              color: green,
                              borderRadius: BorderRadius.circular(12),
                              // border: Border.all(strokeAlign: BorderSide.strokeAlignOutside,color: Colors.grey),
                                ),
                                child: Center(child: Icon(Icons.add,color: Colors.white,size: 35,)),),
                            );
                      }
                      ),
                  // Consumer<Mainprovider>(
                  //     builder: (context,value,child) {
                  //       return InkWell(
                  //         onTap: () {
                  //           showBottomSheet2(context);
                  //         },
                  //         child:Column(
                  //           children:List.generate(value.fileImageList.length, (index) {
                  //             return CircleAvatar(
                  //               radius: 60,
                  //               backgroundImage: FileImage(value.fileImageList[index]),
                  //             );
                  //           }),
                  //         ),
                  //       );
                  //     }
                  // ),
                  //
                  // SizedBox(width:7,),
                  //
                  // Consumer<Mainprovider>(
                  //     builder: (context,value,child) {
                  //       return InkWell(
                  //         onTap: () {
                  //           showBottomSheet(context);
                  //         },
                  //         child: Center(
                  //           child:value.fileImage!=null? CircleAvatar(
                  //             radius:60,
                  //             backgroundColor:Colors.grey,
                  //             backgroundImage: FileImage(value.fileImage!),
                  //           ):value.conImage!=""?
                  //           child: CircleAvatar(
                  //             radius:60,
                  //             backgroundColor:Colors.grey,
                  //             child:Icon(Icons.image,size:45),
                  //           ),
                  //         ),
                  //       );
                  //     }
                  //    ),
                   SizedBox(height: 10,),
                  Consumer<HomeProvider>(
                      builder: (context,value,child) {
                       return registration(TextInputType.text, green, "Enter Mobile Number", Colors.grey,  height/14, width/1.1,value.Mobilecontroller);
                     }
                   ),
                    // SizedBox(height: height/24,),
                  Consumer<HomeProvider>(
                      builder: (context,value,child) {
                        return registration(TextInputType.text, green, "Enter Whatsapp Number", Colors.grey,  height/14, width/1.1,value.Whatsappcontroller);
                      }
                    ),
                  SizedBox(height: 10,),
                  Text("Add your work type :",style: TextStyle(color: green,fontFamily: "semibold",fontSize: 10),),
                  Consumer<HomeProvider>(
                      builder: (context2,value3,child) {
                        return Autocomplete<Categorymodel>(
                          optionsBuilder: (TextEditingValue textEditingValue) {
                            return value3.categorylist
                                .where((Categorymodel item) => item.text
                                .toLowerCase()
                                .contains(textEditingValue.text.toLowerCase()))
                                .toList();
                          },
                          displayStringForOption: (Categorymodel option) =>
                          option.text,
                          fieldViewBuilder: (BuildContext context,
                              TextEditingController fieldTextEditingController,
                              FocusNode fieldFocusNode,
                              VoidCallback onFieldSubmitted) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              fieldTextEditingController.text = value3.categorycontroler.text;
                            });

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width / 1.1,
                                  child: TextFormField(
                                    cursorColor: Colors.brown,
                                    maxLines: 1,
                                    style: const TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.w200),
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.black),
                                          borderRadius: BorderRadius.circular(10)),
                                      hintText: "Choose type",
                                      hintStyle: const TextStyle(
                                          color: Colors.black45, fontFamily: 'cantata'),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    onChanged: (txt) {

                                    },
                                    controller: fieldTextEditingController,
                                    focusNode: fieldFocusNode,
                                  ),
                                ),
                              ),
                            );
                          },
                          optionsViewBuilder: (BuildContext context,
                              AutocompleteOnSelected<Categorymodel> onSelected,
                              Iterable<Categorymodel> options) {
                            return Align(
                              alignment: Alignment.topLeft,
                              child: Material(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(15)),
                                  width: 200,
                                  height: 200,
                                  child: ListView.builder(
                                    padding: const EdgeInsets.all(10.0),
                                    itemCount: options.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      final Categorymodel option = options.elementAt(index);

                                      return GestureDetector(
                                        onTap: () {
                                          onSelected(option);
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                // border: Border(left: BorderSide(color: Colors.white,width: .6,
                                                // ))
                                              ),
                                              height: 30,
                                              width: 200,
                                              child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Center(
                                                      child: Text(option.text,
                                                          style: const TextStyle(
                                                            fontFamily: 'cantata',
                                                            color: Colors.black,
                                                          )),
                                                    ),
                                                  ]),
                                            ),
                                            Divider(
                                              thickness: 1,
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                          onSelected: (Categorymodel selection) {
                            value3.categorycontroler.text = selection.text;
                            value3.productSelectedcategoryid = selection.id;
                            value3.getSubcategoryuser(selection.id);
                          },
                        );
                      }
                  ),
                  SizedBox(height: 10,),
                  Text("Choose your exact type in list :",style: TextStyle(color: green,fontFamily: "semibold",fontSize: 10),),
                  Consumer<HomeProvider>(
                      builder: (context2,value3,child) {
                        return Autocomplete<Subcategorymodel>(
                          optionsBuilder: (TextEditingValue textEditingValue) {
                            return value3.Subcategorylistuser
                                .where((Subcategorymodel item) => item.text
                                .toLowerCase()
                                .contains(textEditingValue.text.toLowerCase()))
                                .toList();
                          },
                          displayStringForOption: (Subcategorymodel option) =>
                          option.text,
                          fieldViewBuilder: (BuildContext context,
                              TextEditingController fieldTextEditingController,
                              FocusNode fieldFocusNode,
                              VoidCallback onFieldSubmitted) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              fieldTextEditingController.text = value3.subCategoryAutoController.text;
                            });

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width / 1.1,
                                  height: height/14,
                                  child: TextFormField(
                                    cursorColor: Colors.brown,
                                    maxLines: 1,
                                    style: const TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.w200),
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.black),
                                          borderRadius: BorderRadius.circular(10)),
                                      hintText: "Select Your type",
                                      hintStyle: const TextStyle(
                                          color: Colors.black45, fontFamily: 'cantata'),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    onChanged: (txt) {

                                    },
                                    controller: fieldTextEditingController,
                                    focusNode: fieldFocusNode,
                                  ),
                                ),
                              ),
                            );
                          },
                          optionsViewBuilder: (BuildContext context,
                              AutocompleteOnSelected<Subcategorymodel> onSelected,
                              Iterable<Subcategorymodel> options) {
                            return Align(
                              alignment: Alignment.topLeft,
                              child: Material(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(15)),
                                  width: 200,
                                  height: 200,
                                  child: ListView.builder(
                                    padding: const EdgeInsets.all(10.0),
                                    itemCount: options.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      final Subcategorymodel option = options.elementAt(index);

                                      return GestureDetector(
                                        onTap: () {
                                          onSelected(option);
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                // border: Border(left: BorderSide(color: Colors.white,width: .6,
                                                // ))
                                              ),
                                              height: 30,
                                              width: 200,
                                              child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Center(
                                                      child: Text(option.text,
                                                          style: const TextStyle(
                                                            fontFamily: 'cantata',
                                                            color: Colors.black,
                                                          )),
                                                    ),
                                                  ]),
                                            ),
                                            Divider(
                                              thickness: 1,
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                          onSelected: (Subcategorymodel selection) {
                            value3.subCategoryAutoController.text = selection.text;
                            value3.productSelectedcategoryid = selection.id;
                            print("on changeddddddd");
                          },
                        );
                      }
                  ),

                  SizedBox(height: height/12,),
                  Consumer<HomeProvider>(
                    builder: (context,value,child) {
                      return InkWell(
                        onTap: () {
                          final FormState? form=formkey.currentState;
                          if (form!.validate()){


                          if(From=="WORK") {

                            // value.SetWorkLocation();
                          value.workersRegistration("WORK", userid);
                          }else{
                            value.workersRegistration("CONTRACTOR",userid);
                            // value.contractorRegistration();

                          }
                          Navigator.pop(context);
                          }
                        },
                          child: add(height/16, width/3, 10, "Save"));
                    }
                  ),
                  SizedBox(height: height/8,),
                  // Consumer<HomeProvider>(
                  //   builder: (context,  value,  child) {
                  //     return Padding(
                  //       padding:  EdgeInsets.only(right: width/22,left:width/22),
                  //       child: GridView.builder(physics: NeverScrollableScrollPhysics(),
                  //         shrinkWrap: true,
                  //         itemCount: 16,
                  //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
                  //             crossAxisSpacing: 10,
                  //             mainAxisSpacing: 10,
                  //           mainAxisExtent: 37
                  //         ),
                  //         itemBuilder: (BuildContext context, int index) {
                  //           return Container(
                  //             height: 5,
                  //             width: 10,
                  //             decoration: BoxDecoration(
                  //                 color:Colors.grey,
                  //                 borderRadius: BorderRadius.circular(10)
                  //             ),
                  //             child: Center(child: Text(value.grid[index],style: TextStyle(color: Colors.black),)),
                  //           );
                  //         },
                  //       ),
                  //     );
                  //   },
                  //
                  // )
                ]
              ),
            ),
          ))
    );

  }
}
void showBottomSheet1(BuildContext context) {
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
                {provider.getImgcamerareg(), Navigator.pop(context)}),
            ListTile(
                leading: Icon(Icons.photo, color: green),
                title: const Text(
                  'Gallery',
                ),
                onTap: () =>
                {provider.getImggalleryreg(), Navigator.pop(context)}),
          ],
        );
      });
  //ImageSource
}

class LocationPicker extends StatefulWidget {

  @override
  _LocationPickerState createState() => _LocationPickerState();

}

class _LocationPickerState extends State<LocationPicker> {
  late GoogleMapController mapController;
  late LatLng selectedLocation = LatLng(0.0, 0.0);

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  void _onMapTap(LatLng location) {
    setState(() {
      selectedLocation = location;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("sfddgfggbgfh");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Location'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        onTap: _onMapTap,
        initialCameraPosition: CameraPosition(
          target: LatLng(0.0, 0.0),
          zoom: 2.0,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (selectedLocation != LatLng(0.0, 0.0)) { // Check if a location is selected
            print('Selected Location: $selectedLocation');
            // You can handle the selected location here
          } else {
            print('No location selected');
          }
        },
        label: Text('Select Location'),
        icon: Icon(Icons.map),
      ),

    );
  }
}
void showBottomSheet2(BuildContext context) {
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
                {provider.getImgcamerareg1(),Navigator.pop(context)}),
            ListTile(
                leading: Icon(Icons.photo, color: green),
                title: const Text(
                  'Gallery',
                ),
                onTap: () =>
                {provider.getImggalleryreg1(), Navigator.pop(context)}),
          ],




        );
      });
  //ImageSource
}
