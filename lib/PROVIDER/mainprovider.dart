//
//
// import 'dart:collection';
// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../CONSTANTS/my colors.dart';
// import '../modelclass/modelclass.dart';
//
// class mainprovider extends ChangeNotifier {
//
//   final FirebaseFirestore db = FirebaseFirestore.instance;
//   Reference ref = FirebaseStorage.instance.ref("IMAGEURL");
//
//
//   List<String> imagelist = [
//     "assets/caroo.png",
//     "assets/labor 2.png",
//     "assets/child 2.png",
//   ];
//   List<String> images = [
//     "assets/image 2.png",
//     "assets/Company managers visiting their employees in a factory happy african american businesswoman is shaking hands with one worker.png",
//     "assets/driver.png",
//     "assets/High angle of hand with glove using paint from can.png",
//     "assets/Carpenter working on a piece of wood with pencil.png",
//     "assets/Young engineer adjusting autonomous heating.png",
//     "assets/Cutting metal with plasma equipment on plant..png",
//     "assets/Designer at work in office.png",
//     "assets/Bricklaying. construction worker building a brick wall..png",
//     "assets/A male electrician works in a switchboard with an electrical connecting cable..png",
//     "assets/Joyful young woman in a tobacco plantation..png",
//     "assets/Tiler working on renovation of apartment.png",
//     "assets/Power plant construction.png",
//     "assets/Muscular car service worker repairing vehicle..png",
//     "assets/Frame of different tools and toy car on table.png",
//     "assets/Farmer interacting with farmers in apple orchard.png",
//   ];
//   List<String> containertext = [
//     "CONTRACTORS",
//     "LABORS",
//     "DRIVER",
//     "PAINTER",
//     "CARPENTER",
//     "PLUMBER",
//     "WELDER",
//     "DESIGNER",
//     "MISTRI",
//     "ELECTRICIAN",
//     "FARM",
//     "TILES",
//     "CONSTRUCTION",
//     "MECHANICS",
//     "TECHNICIAN",
//     "OTHER WORKS",
//   ];
//   List<String> clicktext = [
//     "Click now",
//     "Click now",
//     "Click now",
//     "Click now",
//     "Click now",
//     "Click now",
//     "Click now",
//     "Click now",
//     "Click now",
//     "Click now",
//     "Click now",
//     "Click now",
//     "Click now",
//     "Click now",
//     "Click now",
//     "Click now",
//   ];
//   List<String> bookingtext = [
//     "Worker No:22",
//     "Worker No:11",
//     "Worker No:16"
//   ];
//   List<String> bookintwo = [
//     "Electrician",
//     "Tiles Worker",
//     "Driver"
//   ];
//   List<String> bottomtime = [
//     "12-01-2024 | 08:56 pm",
//     "10-09-2023 | 06:43 pm",
//     "30-08-2023 | 07:22 am"
//   ];
//   List<String> booking = [
//     "Check Now",
//     "Check Now",
//     "Check Now",
//
//   ];
//   List<String> notitext = [
//     "Update",
//     "New Labor Added",
//     "New Labor Added",
//   ];
//   List<String> secondtext = [
//     "New Version Update",
//     "In Driver Category",
//     "In Contractor Category "
//   ];
//   List<String> notitime = [
//     "12-01-2024 | 08:56 pm",
//     "10-09-2023 | 06:43 pm",
//     "30-08-2023 | 07:22 am"
//   ];
//   List<String> grid = [
//     "Contractor",
//     "Labor",
//     "Driver",
//     "Painter",
//     "Carpenter",
//     "Plumber",
//     "Welder",
//     "Designer",
//     "Mistri",
//     "Electrician",
//     "Farm",
//     "Tiles",
//     "Construction",
//     "Mechanic",
//     "Technician",
//     "Other Works"
//   ];
//   List<String> job = [
//     "Designer",
//     "Catering Worker",
//     "General Helper",
//     "Cleaning Worker",
//     "Mechanical Worker",
//     "Interior Painter",
//     "Construction Worker",
//     "Scrap Worker",
//     "Tree Cutter",
//     "Driver"
//   ];
//   List<String>home = [
//     "User List",
//     "Carousel",
//     "Registration",
//     "Categories",
//     "Notifications",
//     "Sub Category",
//     "All Workers"
//   ];
//   List<String> user = [
//     "Name: Amirx",
//     "Name: Rahuk np",
//     "Name: saalu",
//     "Name: Prajeesh",
//     "Name: Bisnii",
//   ];
//   List<String> address = [
//     "Address: Krishnapuram",
//     "Address: Puthanveettil",
//     "Address: Chilambukaden",
//     "Address: Cholayil",
//     "Address: Kannanveettil",
//   ];
//   List<String> num = [
//     "Phone: 2030405060",
//     "Phone: 2030405060",
//     "Phone: 2030405060",
//     "Phone: 2030405060",
//     "Phone: 2030405060",
//
//   ];
//   List<String>caro = [
//     "assets/caroo.png",
//     "assets/labor 2.png",
//     "assets/child 2.png",
//   ];
//   int activeindex = 0;
//
//   void Activeindex(int index) {
//     activeindex = index;
//     notifyListeners();
//   }
//
//   File? carouselFileimg = null;
//   String Image = '';
//
//   bool caroucellodder=false;
//   Future<void> addcarousel(String from,String oldid) async {
//     caroucellodder=true;
//     notifyListeners();
//     String id = DateTime.now().microsecondsSinceEpoch.toString();
//     HashMap<String, dynamic>map = HashMap();
//    if(from=="NEW"){
//      map["Carousel_Id"] = id;
//    }
//
//     if (carouselFileimg != null) {
//       String photoId = DateTime
//           .now()
//           .millisecondsSinceEpoch
//           .toString();
//       ref = FirebaseStorage.instance.ref().child(photoId);
//       await ref.putFile(carouselFileimg!).whenComplete(() async {
//         await ref.getDownloadURL().then((value) {
//           map["Photo"] = value;
//           notifyListeners();
//         });
//         notifyListeners();
//       });
//       notifyListeners();
//     } else {
//       map["Photo"] = Image;
//     }if(from=="EDIT"){
//       db.collection("CAROUSEL").doc(oldid).update(map);
//     }else{
//       db.collection("CAROUSEL").doc(id).set(map);
//     }
//     caroucellodder=false;
//     notifyListeners();
//     getcarousel();
//     notifyListeners();
//   }
//
//   void setImage(File image) {
//     carouselFileimg = image;
//     notifyListeners();
//   }
//
//   Future getImggallery() async {
//     final imagePicker = ImagePicker();
//     final pickedImage =
//     await imagePicker.pickImage(source: ImageSource.gallery);
//
//     if (pickedImage != null) {
//       cropImage(pickedImage.path, "");
//     } else {
//       print('No image selected.');
//     }
//   }
//
//   Future getImgcamera() async {
//     final imgPicker = ImagePicker();
//     final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);
//
//     if (pickedImage != null) {
//       cropImage(pickedImage.path, "");
//     } else {
//       print('No image selected.');
//     }
//   }
//
//   Future<void> cropImage(String path, String from) async {
//     final croppedFile = await ImageCropper().cropImage(
//       sourcePath: path,
//       aspectRatioPresets: Platform.isAndroid
//           ? [
//         CropAspectRatioPreset.square,
//         CropAspectRatioPreset.ratio3x2,
//         CropAspectRatioPreset.original,
//         CropAspectRatioPreset.ratio4x3,
//         CropAspectRatioPreset.ratio16x9,
//       ]
//           : [
//         CropAspectRatioPreset.original,
//         CropAspectRatioPreset.square,
//         CropAspectRatioPreset.ratio3x2,
//         CropAspectRatioPreset.ratio4x3,
//         CropAspectRatioPreset.ratio5x3,
//         CropAspectRatioPreset.ratio5x4,
//         CropAspectRatioPreset.ratio7x5,
//         CropAspectRatioPreset.ratio16x9,
//         CropAspectRatioPreset.ratio16x9
//       ],
//       uiSettings: [
//         AndroidUiSettings(
//             toolbarTitle: 'Cropper',
//             toolbarColor: Colors.white,
//             toolbarWidgetColor: Colors.black,
//             initAspectRatio: CropAspectRatioPreset.original,
//             lockAspectRatio: false),
//         IOSUiSettings(
//           title: 'Cropper',
//         )
//       ],
//     );
//     if (croppedFile != null) {
//       carouselFileimg = File(croppedFile.path);
//       // print(Registerfileimg.toString() + "fofiifi");
//       notifyListeners();
//     }
//   }
//
//   void Carouselclear() {
//     carouselFileimg = null;
//     Image = '';
//   }
//
//   List<Carouselmodel>carouselist = [];
// bool GetCaroucellodder=false;
//   void getcarousel() {
//     GetCaroucellodder=true;
//     db.collection("CAROUSEL").get().then((value) {
//       if (value.docs.isNotEmpty) {
//         GetCaroucellodder=false;
//         notifyListeners();
//         carouselist.clear();
//         for (var element in value.docs) {
//           carouselist.add(
//               Carouselmodel(element.id, element.get("Photo").toString()));
//           notifyListeners();
//         };
//       }
//     });
//     notifyListeners();
//   }
//
//   File? CAtegoryfileimg = null;
//   String Image1 = '';
//
//   TextEditingController categorynamecontroller = TextEditingController();
//
//   bool categorylodder=false;
//   Future<void> addcategory(String from, String oldid) async {
//     categorylodder=true;
//     notifyListeners();
//     String id = DateTime
//         .now()
//         .microsecondsSinceEpoch
//         .toString();
//     HashMap<String, dynamic>map = HashMap();
//     map["CATEGORY_NAME"] = categorynamecontroller.text;
//     if (from == "NEW") {
//       map ["Category_Id"] = id;
//     }
//     if (CAtegoryfileimg != null) {
//       String photoId = DateTime
//           .now()
//           .millisecondsSinceEpoch
//           .toString();
//       ref = FirebaseStorage.instance.ref().child(photoId);
//       await ref.putFile(CAtegoryfileimg!).whenComplete(() async {
//         await ref.getDownloadURL().then((value) {
//           map["PHOTO"] = value;
//           notifyListeners();
//         });
//         notifyListeners();
//       });
//       notifyListeners();
//     } else {
//       map["PHOTO"] = Image;
//     }
//     if (from == "EDIT") {
//       db.collection("CATEGORY").doc(oldid).update(map);
//     } else {
//       db.collection("CATEGORY").doc(id).set(map);
//     }
//     categorylodder=false;
//     notifyListeners();
//     getCategory();
//     notifyListeners();
//   }
//
//   void setImage1(File image) {
//     CAtegoryfileimg = image;
//     notifyListeners();
//   }
//
//   Future getImggallery1() async {
//     final imagePicker = ImagePicker();
//     final pickedImage =
//     await imagePicker.pickImage(source: ImageSource.gallery);
//
//     if (pickedImage != null) {
//       cropImage1(pickedImage.path, "");
//     } else {
//       print('No image selected.');
//     }
//   }
//
//   Future getImgcamera1() async {
//     final imgPicker = ImagePicker();
//     final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);
//
//     if (pickedImage != null) {
//       cropImage1(pickedImage.path, "");
//     } else {
//       print('No image selected.');
//     }
//   }
//
//   Future<void> cropImage1(String path, String from) async {
//     final croppedFile = await ImageCropper().cropImage(
//       sourcePath: path,
//       aspectRatioPresets: Platform.isAndroid
//           ? [
//         CropAspectRatioPreset.square,
//         CropAspectRatioPreset.ratio3x2,
//         CropAspectRatioPreset.original,
//         CropAspectRatioPreset.ratio4x3,
//         CropAspectRatioPreset.ratio16x9,
//       ]
//           : [
//         CropAspectRatioPreset.original,
//         CropAspectRatioPreset.square,
//         CropAspectRatioPreset.ratio3x2,
//         CropAspectRatioPreset.ratio4x3,
//         CropAspectRatioPreset.ratio5x3,
//         CropAspectRatioPreset.ratio5x4,
//         CropAspectRatioPreset.ratio7x5,
//         CropAspectRatioPreset.ratio16x9,
//         CropAspectRatioPreset.ratio16x9
//       ],
//       uiSettings: [
//         AndroidUiSettings(
//             toolbarTitle: 'Cropper',
//             toolbarColor: Colors.white,
//             toolbarWidgetColor: Colors.black,
//             initAspectRatio: CropAspectRatioPreset.original,
//             lockAspectRatio: false),
//         IOSUiSettings(
//           title: 'Cropper',
//         )
//       ],
//     );
//     if (croppedFile != null) {
//       CAtegoryfileimg = File(croppedFile.path);
//       // print(Registerfileimg.toString() + "fofiifi");
//       notifyListeners();
//     }
//   }
//
//   void Categoryclear() {
//     categorynamecontroller.clear();
//     CAtegoryfileimg = null;
//     Image1 = '';
//   }
//
//   List<Categorymodel>categorylist = [];
//   bool getcategorylodder=false;
//   void getCategory() {
//     getcategorylodder=true;
//     db.collection("CATEGORY").get().then((value) {
//       getcategorylodder=false;
//       notifyListeners();
//       if (value.docs.isNotEmpty) {
//         categorylist.clear();
//         for (var element in value.docs) {
//           categorylist.add(Categorymodel(
//             element.id, element.get("PHOTO").toString(),
//             element.get("CATEGORY_NAME").toString(),));
//         };
//       }
//     });
//     notifyListeners();
//   }
//
//   TextEditingController Namecontroller1 = TextEditingController();
//   TextEditingController Addresscontroller1 = TextEditingController();
//   TextEditingController Phonecontroller1 = TextEditingController();
//
//
//
//
//   void Signupregistration() {
//     String id = DateTime.now().millisecondsSinceEpoch.toString();
//     HashMap<String, dynamic>map1 = HashMap();
//     map1["STATUS"] = "REQUEST";
//     map1["SIGNUP_ID"] = id;
//     map1["SIGNUP_NAME"] = Namecontroller1.text;
//     map1["SIGNUP_ADDRESS"] = Addresscontroller1.text;
//     map1["SIGNUP_PHONE"] = Phonecontroller1.text;
//     HashMap<String, dynamic>Usermap = HashMap();
//     Usermap["USER_ID"] = id;
//     Usermap["USER_NAME"] = Namecontroller1.text;
//     Usermap["TYPE"] = "USER";
//     Usermap["USER_PHONE"] = Phonecontroller1.text;
//     db.collection("USER").doc(id).set(Usermap);
//     db.collection("CUSTOMER").doc(id).set(map1);
//     notifyListeners();
//   }
//
//   List<Signupmodel>Signuplist = [];
//
//   void getsignup() {
//     db.collection("CUSTOMER").get().then((value) {
//       if (value.docs.isNotEmpty) {
//         Signuplist.clear();
//         for (var element in value.docs) {
//           Signuplist.add(Signupmodel(
//               element.id, element.get("SIGNUP_NAME").toString(),
//               element.get("SIGNUP_ADDRESS").toString(),
//               element.get("SIGNUP_PHONE").toString(),
//               element.get("STATUS").toString()));
//           notifyListeners();
//         };
//       }
//     });
//     notifyListeners();
//   }
//    void Editcustomer(String id){
//     db.collection("CUSTOMER").doc(id).get().then((value) {
//       if (value.exists){
//         Map<dynamic,dynamic>map=value.data() as Map;
//         Namecontroller1.text=map["SIGNUP_NAME"].toString();
//         Addresscontroller1.text=map["SIGNUP_ADDRESS"].toString();
//         getsignup();
//         notifyListeners();
//       }
//     });
//    }
//
//
//
//   void Editcategory(String id) {
//     db.collection("CATEGORY").doc(id).get().then((value) {
//       if (value.exists) {
//         Map<dynamic, dynamic>map = value.data() as Map;
//         categorynamecontroller.text = map["CATEGORY_NAME"].toString();
//         Image = map["PHOTO"];
//         getCategory();
//         notifyListeners();
//       }
//     });
//   }
//
//   void Deletetcategory(id, BuildContext context) {
//     db.collection("CATEGORY").doc(id).delete();
//     ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Delete Successfully"),
//           backgroundColor: green,
//         ));
//     notifyListeners();
//     getCategory();
//   }
//
//   void Editcarousel(String id) {
//     db.collection("CAROUSEL").doc(id).get().then((value) {
//       if (value.exists) {
//         Map<dynamic, dynamic>map = value.data() as Map;
//         Image = map["Photo"];
//         getcarousel();
//         notifyListeners();
//       }
//     });
//   }
//   void Deletecarousel(id, BuildContext context) {
//     db.collection("CAROUSEL").doc(id).delete();
//     ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Delete Successfully"),
//           backgroundColor: green,
//         ));
//     notifyListeners();
//     getcarousel();
//   }
//
//   TextEditingController subcategoryct = TextEditingController();
//   TextEditingController categorycontroler = TextEditingController();
//
//   String productSelectedcategoryid="";
//  bool Subcategorylodder=false;
//   void addsubcategory(String from,String oldid) {
//     Subcategorylodder=true;
//     notifyListeners();
//     String id = DateTime.now().microsecondsSinceEpoch.toString();
//     HashMap<String, dynamic>map = HashMap();
//     map["Category_Name"] = categorycontroler.text;
//     map["Category_Id"] = productSelectedcategoryid;
//     map["SUBCATEGORY_NAME"] = subcategoryct.text;
//     if(from=="NEW"){
//       map["SubCategory_Id"] = id;
//     }if(from=="EDIT"){
//       db.collection("SUBCATEGORY").doc(oldid).update(map);
//     }else{
//       db.collection("SUBCATEGORY").doc(id).set(map);
//     }
//     Subcategorylodder=false;
//     notifyListeners();
//     getSubcategory();
//     notifyListeners();
//   }
//
//   void Subcategoryclear() {
//     subcategoryct.clear();
//   }
//
//   List<Subcategorymodel>Subcategorylist = [];
//  bool Getsubcatlodder=false;
//   void getSubcategory() {
//     Getsubcatlodder=true;
//     db.collection("SUBCATEGORY").get().then((value) {
//       Getsubcatlodder=false;
//       notifyListeners();
//       if (value.docs.isNotEmpty) {
//         Subcategorylist.clear();
//         for (var element in value.docs) {
//           Subcategorylist.add(Subcategorymodel(
//             element.id, element.get("SUBCATEGORY_NAME").toString(),));
//           notifyListeners();
//         };
//       }
//     });
//     notifyListeners();
//   }
//   void Editsubcategory(String id) {
//     db.collection("SUBCATEGORY").doc(id).get().then((value) {
//       if (value.exists) {
//         Map<dynamic, dynamic>map = value.data() as Map;
//         // map["SUBCATEGORY_NAME"] = subcategoryct.text;
//         subcategoryct.text=map["SUBCATEGORY_NAME"].toString();
//         getSubcategory();
//         notifyListeners();
//       }
//     });
//     notifyListeners();
//   }
//   void Deletesubcategory(id, BuildContext context) {
//     db.collection("SUBCATEGORY").doc(id).delete();
//     ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Delete Successfully"),
//           backgroundColor: green,
//         ));
//     notifyListeners();
//     getSubcategory();
//   }
//
// }