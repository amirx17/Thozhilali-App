import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../USER/Registration_Screen.dart';
import 'my colors.dart';

Widget textformfield(
    TextInputType number, Color mycolor, String hinttext, Color textcolor,dynamic icn,TextEditingController controller) {
  return TextFormField(style: TextStyle(
    color: Colors.white
  ),
    controller: controller,
    textAlign: TextAlign.left,
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      prefixIcon: Icon((icn),
        size: 20,
        color: white,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      fillColor: green.withOpacity(0.6),
      filled: true,
      // contentPadding: const EdgeInsets.symmetric(vertical: 14),
      hintText: hinttext,

      hintStyle: TextStyle(
        color: textcolor,
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
  );
}

Widget logbutton(
    double hyt, double wdth, Color clr, double rds, String amx, Color txtclr) {
  return Container(
    height: hyt,
    width: wdth,
    decoration: BoxDecoration(
      color: clr,
      borderRadius: BorderRadius.circular(rds),
    ),
    child: Center(
        child: Text(
      amx,
      style: TextStyle(
          color: txtclr,
          fontWeight: FontWeight.w400,
          fontSize: 14,
          ),
    )),
  );
}
Widget otpbox(double hyt,double edth,Color clr,double rds){
  return Container(
    height:hyt,
    width:edth,
    decoration: BoxDecoration(
      color: clr,
      borderRadius: BorderRadius.circular(rds)
    ),
  );
}


Widget searchbar(
    TextInputType number, Color mycolor, String hinttext, Color textcolor,dynamic icn,double sz,double hytt,double wdth,Function change) {
  return Container(
    height: hytt,
    width:wdth ,
    child: TextFormField(
      textAlign: TextAlign.left,
      keyboardType: number,
      onChanged: (value) {
        change(value);
      },
      decoration: InputDecoration(
        suffixIcon: Icon((icn),
          size: sz,
          color: Colors.grey,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 22, vertical: 16),
        filled: true,
        // contentPadding: const EdgeInsets.symmetric(vertical: 14),
        hintText: hinttext,

        hintStyle: TextStyle(
          color: textcolor,
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
  );
}

Widget profile(
    TextInputType number, Color mycolor,  Color textcolor,dynamic icn,double sz,double hytt,double wdth,dynamic iconee,double sizeee,TextEditingController controller) {
  return Container(
    height: hytt,
    width:wdth ,
    child: TextFormField(
      style: TextStyle(color: Colors.white),
      controller: controller,
      textAlign: TextAlign.left,
      keyboardType: number,
      decoration:
      InputDecoration(
        prefixIcon: Icon((icn),
          size: sz,
          color: white,
        ),
        suffixIcon: Icon((iconee),size: sizeee,color: white,),

        contentPadding: EdgeInsets.symmetric(horizontal: 22, vertical: 12),
        fillColor: green,
        filled: true,
        // contentPadding: const EdgeInsets.symmetric(vertical: 14),
        hintStyle: TextStyle(
          color: textcolor,
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
  );
}

Widget profilelocation(
    TextInputType number, Color mycolor,String hint,  Color textcolor,dynamic icn,double sz,double hytt,double wdth,dynamic iconee,double sizeee,) {
  return Container(
    height: hytt,
    width:wdth ,
    child: TextFormField(style: TextStyle(color: Colors.white),
      textAlign: TextAlign.left,
      keyboardType: number,
      decoration:
      InputDecoration(
        prefixIcon: Icon((icn),
          size: sz,
          color: white,
        ),
        suffixIcon: Icon((iconee),size: sizeee,color: white,),

        contentPadding: EdgeInsets.symmetric(horizontal: 22, vertical: 12),
        fillColor: green,
        filled: true,
        // contentPadding: const EdgeInsets.symmetric(vertical: 14),
     hintText: hint,
        hintStyle: TextStyle(
          color: textcolor,
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
  );
}
Widget profilenumber(
    TextInputType number, Color mycolor,  Color textcolor,dynamic icn,double sz,double hytt,double wdth,dynamic iconee,double sizeee,TextEditingController controller) {
  return Container(
    height: hytt,
    width:wdth ,
    child: TextFormField(
      enabled: false,
      style: TextStyle(color: Colors.white),
      controller: controller,
      textAlign: TextAlign.left,
      keyboardType: number,
      decoration:
      InputDecoration(
        prefixIcon: Icon((icn),
          size: sz,
          color: white,
        ),

        contentPadding: EdgeInsets.symmetric(horizontal: 22, vertical: 12),
        fillColor: green,
        filled: true,
        // contentPadding: const EdgeInsets.symmetric(vertical: 14),
        hintStyle: TextStyle(
          color: textcolor,
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
  );
}

Widget location(
    TextInputType number, Color mycolor, String hinttext, Color textcolor,dynamic icn,double sz,double hytt,double wdth) {
  return Container(
    height: hytt,
    width:wdth ,
    child: TextFormField(
      textAlign: TextAlign.left,
      keyboardType: number,
      decoration: InputDecoration(
        prefixIcon: Icon((icn),
          size: sz,
          color: white,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 22, vertical: 18),
        fillColor: green,
        filled: true,
        // contentPadding: const EdgeInsets.symmetric(vertical: 14),
        hintText: hinttext,

        hintStyle: TextStyle(
          color: textcolor,
          fontSize: 13,
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
  );
}

Widget registration(TextInputType number, Color mycolor, String hinttext,
    Color textcolor,double hytt,double wdth,TextEditingController ct) {
  return
    Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    height: hytt,
    width:wdth ,
    child: TextFormField(style: TextStyle(color: Colors.white),
      controller: ct,
      textAlign: TextAlign.left,
      keyboardType: number,
      decoration: InputDecoration(

        contentPadding: EdgeInsets.symmetric(horizontal: 22, vertical: 22),
        fillColor: green,
        filled: true,
        // contentPadding: const EdgeInsets.symmetric(vertical: 14),
        hintText: hinttext,

        hintStyle: TextStyle(
          color: textcolor,
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
          return "This field is required";
        } else {
          return null;
        }
      },
    ),
  );
}

Widget locationText(TextInputType number, Color mycolor, String hinttext,
    Color textcolor,double hytt,double wdth,TextEditingController ct) {
  return
    Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    height: hytt,
    width:wdth ,
    child: TextFormField(
      onTap: (){
        print("ggwfeferfefgeeeeeeeeeeeeee");
        LocationPicker();
      },
      style: TextStyle(color: Colors.white),
      controller: ct,
      textAlign: TextAlign.left,
      keyboardType: number,
      decoration: InputDecoration(

        contentPadding: EdgeInsets.symmetric(horizontal: 22, vertical: 22),
        fillColor: green,
        filled: true,
        // contentPadding: const EdgeInsets.symmetric(vertical: 14),
        hintText: hinttext,

        hintStyle: TextStyle(
          color: textcolor,
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
          return "This field is required";
        } else {
          return null;
        }
      },
    ),
  );
}

Widget photos(double hyt,double edth,Color clr,double rds,dynamic iconz,double sizee,Color clreee){
  return Container(
    height:hyt,
    width:edth,
    decoration: BoxDecoration(
        color: clr,
        borderRadius: BorderRadius.circular(rds)
    ),
    child: Icon((iconz),
      size: sizee,
      color: clreee,
    ),
  );
}

Widget searchbar2(
    TextInputType number, Color mycolor, String hinttext, Color textcolor,dynamic icn,double sz,double hytt,double wdth) {
  return Container(
    height: hytt,
    width:wdth ,
    child: TextFormField(
      textAlign: TextAlign.left,
      keyboardType: number,
      decoration: InputDecoration(
        prefixIcon: Icon((icn),
          size: sz,
          color: Colors.grey,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 22, vertical: 16),
        fillColor: green,
        filled: true,
        // contentPadding: const EdgeInsets.symmetric(vertical: 14),
        hintText: hinttext,

        hintStyle: TextStyle(
          color: textcolor,
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
  );
}
Widget homead(double hyt,double edth,Color clr,double rds,String txt,){
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    height:hyt,
    width:edth,
    decoration: BoxDecoration(
        color: clr,
        borderRadius: BorderRadius.circular(rds),
      // boxShadow: [BoxShadow(color: Colors.grey,blurRadius:10 ,offset: Offset(10, 10))]
    ),
    child:Center(child: Text(txt,style: TextStyle(fontFamily: "semibold",fontSize: 16,color: white),),),
  );
}
Widget add(double hyttt,double wdthhh,double clrr,String textee){
  return Container(
    height: hyttt,
    width: wdthhh,
    decoration: BoxDecoration(
      color: Colors.green,
        borderRadius: BorderRadius.circular(clrr)
    ),
    child:Center(child: Text(textee,style: TextStyle(color: white,fontWeight: FontWeight.w600),)) ,
  );
}
Widget register(double hyttt,double wdthhh,Color colrss,double clrr,String textee){
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    height: hyttt,
    width: wdthhh,
    decoration: BoxDecoration(
        color: colrss,
        borderRadius: BorderRadius.circular(clrr)
    ),
    child:Padding(
      padding: const EdgeInsets.only(left: 18,top: 13),
      child: Text(textee,style: TextStyle(color: white,fontSize: 12),),
    ) ,
  );
}
Widget sad(double hyttt,double wdthhh,double clrr,String textee){
  return Container(
    height: hyttt,
    width: wdthhh,
    decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(clrr)
    ),
    child:Center(child: Text(textee,style: TextStyle(color: white,fontWeight: FontWeight.w600),)) ,
  );

}

Widget Workerfield(
    TextInputType number, Color mycolor,  Color textcolor,double sz,double hytt,double wdth,TextEditingController controller) {
  return Container(
    height: hytt,
    width:wdth ,
    child: TextFormField(
      style: TextStyle(color: Colors.white),
      controller: controller,
      textAlign: TextAlign.left,
      keyboardType: number,
      decoration:
      InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 22, vertical: 12),
        fillColor: green,
        filled: true,
        // contentPadding: const EdgeInsets.symmetric(vertical: 14),
        hintStyle: TextStyle(
          color: textcolor,
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
          return "";
        } else {
          return null;
        }
      },
    ),
  );
}

Widget Workersearcch(
    TextInputType number, Color mycolor,String hint,  Color textcolor,dynamic icn,double sz,double hytt,double wdth,) {
  return Container(
    height: hytt,
    width:wdth,
    child: TextFormField(style: TextStyle(color: Colors.white),
      textAlign: TextAlign.left,
      keyboardType: TextInputType.text,
      decoration:
      InputDecoration(
        prefixIcon: Icon((icn),
          size: sz,
          color: white,
        ),

        contentPadding: EdgeInsets.symmetric(horizontal: 22, vertical: 17),
        fillColor: green,
        filled: true,
        // contentPadding: const EdgeInsets.symmetric(vertical: 14),
        hintText: hint,
        hintStyle: TextStyle(
          color: textcolor,
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
  );
}

























