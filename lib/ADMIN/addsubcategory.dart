import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thzhilali/PROVIDER/MainProvider.dart';
import 'package:thzhilali/PROVIDER/homeprovider.dart';

import '../CONSTANTS/my colors.dart';
import '../CONSTANTS/my widget.dart';
import '../modelclass/modelclass.dart';
import 'AdminSubCategory_Screen.dart';

class subcategory extends StatelessWidget {
  String from;
  String oldid;
  subcategory({super.key,required this.from,required this.oldid});

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
                        builder: (context) => AdminSubCategory(),
                      ));
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: white,
                  size: 19,
                )),
            centerTitle: true,
            title: Text(
             from=="EDIT"?"Edit Sub Category":"Add Sub Category",
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
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: SingleChildScrollView(
          child:Consumer<HomeProvider>(
              builder: (context,value,child) {
              return Column(
                children: [
                  SizedBox(height: height/9,),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: height/14,
                width:width/1.1,
                child: TextFormField(
                  controller: value.subcategoryct,
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(

                    contentPadding: EdgeInsets.symmetric(horizontal: 22, vertical: 22),
                    fillColor: green,
                    filled: true,
                    // contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    hintText: "Enter Name",
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
                      return "Enter Name";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
                  Autocomplete<Categorymodel>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      return value.categorylist
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
                        fieldTextEditingController.text = value.categorycontroler.text;
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
                                hintText: "Category name",
                                hintStyle: const TextStyle(
                                    color: Colors.black45, fontFamily: 'cantata'),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onChanged: (txt) {},
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
                      value.categorycontroler.text = selection.text;
                      value.productSelectedcategoryid = selection.id;
                    },
                  ),
                  SizedBox(height: height/5,),
                InkWell(
                onTap: () {
                  if(from=="NEW"){
                    value.addsubcategory(from,"");
                  }else{
                    value.addsubcategory(from,oldid);
                  }
                value.Subcategoryclear();
                Navigator.pop(context);
                },
                child:
                    value.Getsubcatlodder?Center(child: CircularProgressIndicator(color: green,)):
                add(height/16, width/3, 10, from=="EDIT"?"EDIT":"Add")),



                ],
              );
            }
          ),
        ),
      ),

    );
  }
}
