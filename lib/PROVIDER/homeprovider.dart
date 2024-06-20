import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../CONSTANTS/my colors.dart';
import '../modelclass/modelclass.dart';

class HomeProvider extends ChangeNotifier {

  HomeProvider() {
    loadJsonData();
  }

  final FirebaseFirestore db = FirebaseFirestore.instance;
  Reference ref = FirebaseStorage.instance.ref("IMAGEURL");
  List<String> imagelist = [
    "assets/caroo.png",
    "assets/labor 2.png",
    "assets/child 2.png",
  ];
  List<String> job = [
    "Designer",
    "Catering Worker",
    "General Helper",
    "Cleaning Worker",
    "Mechanical Worker",
    "Interior Painter",
    "Construction Worker",
    "Scrap Worker",
    "Tree Cutter",
    "Driver"
  ];

  List<String> images = [
    "assets/image 2.png",
    "assets/Company managers visiting their employees in a factory happy african american businesswoman is shaking hands with one worker.png",
    "assets/driver.png",
    "assets/High angle of hand with glove using paint from can.png",
    "assets/Carpenter working on a piece of wood with pencil.png",
    "assets/Young engineer adjusting autonomous heating.png",
    "assets/Cutting metal with plasma equipment on plant..png",
    "assets/Designer at work in office.png",
    "assets/Bricklaying. construction worker building a brick wall..png",
    "assets/A male electrician works in a switchboard with an electrical connecting cable..png",
    "assets/Joyful young woman in a tobacco plantation..png",
    "assets/Tiler working on renovation of apartment.png",
    "assets/Power plant construction.png",
    "assets/Muscular car service worker repairing vehicle..png",
    "assets/Frame of different tools and toy car on table.png",
    "assets/Farmer interacting with farmers in apple orchard.png",
  ];
  List<String> containertext = [
    "CONTRACTORS",
    "LABORS",
    "DRIVER",
    "PAINTER",
    "CARPENTER",
    "PLUMBER",
    "WELDER",
    "DESIGNER",
    "MISTRI",
    "ELECTRICIAN",
    "FARM",
    "TILES",
    "CONSTRUCTION",
    "MECHANICS",
    "TECHNICIAN",
    "OTHER WORKS",
  ];
  List<String> clicktext = [
    "Click now",
    "Click now",
    "Click now",
    "Click now",
    "Click now",
    "Click now",
    "Click now",
    "Click now",
    "Click now",
    "Click now",
    "Click now",
    "Click now",
    "Click now",
    "Click now",
    "Click now",
    "Click now",
  ];


  List<String> bookingtext = [
    "Worker No:22",
    "Worker No:11",
    "Worker No:16"
  ];
  List<String> bookintwo = [
    "Electrician",
    "Tiles Worker",
    "Driver"
  ];
  List<String> bottomtime = [
    "12-01-2024 | 08:56 pm",
    "10-09-2023 | 06:43 pm",
    "30-08-2023 | 07:22 am"
  ];
  List<String> booking = [
    "Check Now",
    "Check Now",
    "Check Now",

  ];
  List<String> notitext = [
    "Update",
    "New Labor Added",
    "New Labor Added",
  ];
  List<String> secondtext = [
    "New Version Update",
    "In Driver Category",
    "In Contractor Category "
  ];
  List<String> notitime = [
    "12-01-2024 | 08:56 pm",
    "10-09-2023 | 06:43 pm",
    "30-08-2023 | 07:22 am"
  ];
  List<String> grid = [
    "Contractor",
    "Labor",
    "Driver",
    "Painter",
    "Carpenter",
    "Plumber",
    "Welder",
    "Designer",
    "Mistri",
    "Electrician",
    "Farm",
    "Tiles",
    "Construction",
    "Mechanic",
    "Technician",
    "Other Works"
  ];

  List<Map<String, dynamic>> items = [];
  List<Map<String, dynamic>> filteredItems = [];

  TextEditingController Locationcontrolller = TextEditingController();
  String mainLocation = "";

  void setLocation() {
    mainLocation = Locationcontrolller.text;
    notifyListeners();
  }
 
  void loadJsonData() async {
    String data = await rootBundle.loadString('assets/places.json');
    items = json.decode(data).cast<Map<String, dynamic>>();
    filteredItems.addAll(items);
    notifyListeners();
  }


  void clearRegControls() {
    Registerfileimage = null;
    Registerimg = "";
    categorycontroler.clear();
    Whatsappcontroller.clear();
    Mobilecontroller.clear();
    Workerlist.clear();
    Locationcontroller1.clear();
    Agecontroller.clear();
    Experiencecontroller.clear();
    Namecontroller2.clear();
    Subcategorylistuser.clear();
    subCategoryAutoController.clear();
  }

  void filterItems(String query) {
    final String lowerCaseQuery = query.toLowerCase();
    filteredItems = items.where((item) {
      final String itemName = item['name'].toLowerCase();
      return itemName.contains(lowerCaseQuery);
    }).toList();
    notifyListeners();
  }


  int activeindex = 0;

  void Activeindex(int index) {
    activeindex = index;
    notifyListeners();
  }


  TextEditingController Namecontroller1 = TextEditingController();
  TextEditingController Addresscontroller1 = TextEditingController();
  TextEditingController Phonecontroller1 = TextEditingController();

  File? carouselFileimg = null;
  String Image = '';

  bool caroucellodder = false;

  Future<void> addcarousel(String from, String oldid) async {
    caroucellodder = true;
    notifyListeners();
    String id = DateTime.now().microsecondsSinceEpoch.toString();
    HashMap<String, dynamic>map = HashMap();
    if (from == "NEW") {
      map["Carousel_Id"] = id;
    }

    if (carouselFileimg != null) {
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(carouselFileimg!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          map["Photo"] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      map["Photo"] = Image;
    }
    if (from == "EDIT") {
      db.collection("CAROUSEL").doc(oldid).update(map);
    } else {
      db.collection("CAROUSEL").doc(id).set(map);
    }
    caroucellodder = false;
    notifyListeners();
    getcarousel();
    notifyListeners();
  }

  void setImage(File image) {
    carouselFileimg = image;
    notifyListeners();
  }

  Future getImggallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropImage(pickedImage.path, "");
    } else {
      print('No image selected');
    }
  }

  Future getImgcamera() async {
    final imgPicker = ImagePicker();
    final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      cropImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future<void> cropImage(String path, String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      carouselFileimg = File(croppedFile.path);
      // print(Registerfileimg.toString() + "fofiifi");
      notifyListeners();
    }
  }

  void Carouselclear() {
    carouselFileimg = null;
    Image = '';
  }

  List<Carouselmodel>carouselist = [];
  bool GetCaroucellodder = false;

  void getcarousel() {
    GetCaroucellodder = true;
    db.collection("CAROUSEL").get().then((value) {
      if (value.docs.isNotEmpty) {
        GetCaroucellodder = false;
        notifyListeners();
        carouselist.clear();
        for (var element in value.docs) {
          carouselist.add(
              Carouselmodel(element.id, element.get("Photo").toString()));
          notifyListeners();
        };
      }
    });
    notifyListeners();
  }

  File? CAtegoryfileimg = null;
  String Image1 = '';

  TextEditingController categorynamecontroller = TextEditingController();

  bool categorylodder = false;

  Future<void> addcategory(String from, String oldid) async {
    categorylodder = true;
    notifyListeners();
    String id = DateTime
        .now()
        .microsecondsSinceEpoch
        .toString();
    HashMap<String, dynamic>map = HashMap();
    map["CATEGORY_NAME"] = categorynamecontroller.text;
    if (from == "NEW") {
      map ["Category_Id"] = id;
    }
    if (CAtegoryfileimg != null) {
      String photoId = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(CAtegoryfileimg!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          map["PHOTO"] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      map["PHOTO"] = Image;
    }
    if (from == "EDIT") {
      db.collection("CATEGORY").doc(oldid).update(map);
    } else {
      db.collection("CATEGORY").doc(id).set(map);
    }
    categorylodder = false;
    notifyListeners();
    getCategory();
    notifyListeners();
  }

  void setImage1(File image) {
    CAtegoryfileimg = image;
    notifyListeners();
  }

  Future getImggallery1() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropImage1(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future getImgcamera1() async {
    final imgPicker = ImagePicker();
    final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      cropImage1(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future<void> cropImage1(String path, String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      CAtegoryfileimg = File(croppedFile.path);
      // print(Registerfileimg.toString() + "fofiifi");
      notifyListeners();
    }
  }

  void Categoryclear() {
    categorynamecontroller.clear();
    CAtegoryfileimg = null;
    Image1 = '';
  }
  void searchCategory(String text) {
    final String lowerCaseQuery = text.toLowerCase();
    Filtercategorylist = categorylist.where((item) {
      final String itemName = item.text.toLowerCase();
      return itemName.contains(lowerCaseQuery);
    }).toList();
  }

  List<Categorymodel>categorylist = [];
  List<Categorymodel>Filtercategorylist = [];
  bool getcategorylodder = false;

  void getCategory() {
    getcategorylodder = true;
    db.collection("CATEGORY").get().then((value) {
      getcategorylodder = false;
      notifyListeners();
      if (value.docs.isNotEmpty) {
        categorylist.clear();
        for (var element in value.docs) {
          categorylist.add(Categorymodel(
            element.id, element.get("PHOTO").toString(),
            element.get("CATEGORY_NAME").toString(),));
        }
      }
      Filtercategorylist = categorylist;
    });
    notifyListeners();
  }

  void Signupregistration() {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, dynamic>map1 = HashMap();
    map1["SIGNUP_ID"] = id;
    map1["SIGNUP_NAME"] = Namecontroller1.text;
    map1["SIGNUP_ADDRESS"] = Addresscontroller1.text;
    map1["SIGNUP_PHONE"] = Phonecontroller1.text;
    HashMap<String, dynamic>Usermap = HashMap();
    Usermap["USER_ID"] = id;
    Usermap["USER_NAME"] = Namecontroller1.text;
    Usermap["TYPE"] = "USER";
    Usermap["STATUS"] = "PENDING";
    Usermap["USER_PHONE"] = Phonecontroller1.text;
    db.collection("USER").doc(id).set(Usermap);
    db.collection("CUSTOMER").doc(id).set(map1);
    notifyListeners();
  }

  List<Signupmodel>Signuplist = [];

  void getsignup() {
    db.collection("CUSTOMER").get().then((value) {
      if (value.docs.isNotEmpty) {
        Signuplist.clear();
        for (var element in value.docs) {
          Signuplist.add(Signupmodel(
            element.id, element.get("SIGNUP_NAME").toString(),
            element.get("SIGNUP_ADDRESS").toString(),
            element.get("SIGNUP_PHONE").toString(),
          ));
          notifyListeners();
        };
      }
    });
    notifyListeners();
  }

  void Editcustomer(String id) {
    print(id);
    print("nbhvfbjnm" + Namecontroller1.text);
    db.collection("CUSTOMER").doc(id).get().then((value) {
      if (value.exists) {
        print('dataa  here');
        Map<dynamic, dynamic>map = value.data() as Map;
        Namecontroller1.text = map["SIGNUP_NAME"].toString();
        Addresscontroller1.text = map["SIGNUP_ADDRESS"].toString();
        Phonecontroller1.text = map["SIGNUP_PHONE"].toString();
        getsignup();
        notifyListeners();
      }
      notifyListeners();
    });
  }

  File? Customerimage = null;
  String Image2 = '';

  Future<void> Customerdetails(String Phonenumber, String userid) async {
    HashMap<String, dynamic>map2 = HashMap();
    map2["SIGNUP_ID"] = userid;
    map2["SIGNUP_NAME"] = Namecontroller1.text;
    map2["SIGNUP_ADDRESS"] = Addresscontroller1.text;
    map2["SIGNUP_PHONE"] = Phonenumber;
    if (Customerimage != null) {
      String photoId = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(Customerimage!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          map2["PHOTO"] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      map2["PHOTO"] = Image2;
    }
    db.collection("USER").doc(userid).update(
        {"USER_NAME": Namecontroller1.text});
    db.collection("CUSTOMER").doc(userid).set(map2, SetOptions(merge: true));
  }

  Future getImggalleryc() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropImagec(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future getImgcamerac() async {
    final imgPicker = ImagePicker();
    final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      cropImagec(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future<void> cropImagec(String path, String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      Customerimage = File(croppedFile.path);
      print(Customerimage.toString() + "fofiifi");
      notifyListeners();
    }
    notifyListeners();
  }


  String profileephoto = '';
  String profilename = "";

  void getprofile(String userid) {
    // profileephoto='';
    db.collection("CUSTOMER").doc(userid).get().then((value1) {
      if (value1.exists) {
        Map<dynamic, dynamic> map = value1.data() as Map;
        profileephoto = map["PHOTO"];
        profilename = map["SIGNUP_NAME"];
        notifyListeners();
      }
      notifyListeners();
    });
  }

  void Editcategory(String id) {
    db.collection("CATEGORY").doc(id).get().then((value) {
      if (value.exists) {
        Map<dynamic, dynamic>map = value.data() as Map;
        categorynamecontroller.text = map["CATEGORY_NAME"].toString();
        Image = map["PHOTO" ];
        getCategory();
        notifyListeners();
      }
    });
  }

  void Deletetcategory(id, BuildContext context) {
    db.collection("CATEGORY").doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Delete Successfully"),
          backgroundColor: green,
        ));
    notifyListeners();
    getCategory();
  }

  void Editcarousel(String id) {
    db.collection("CAROUSEL").doc(id).get().then((value) {
      if (value.exists) {
        Map<dynamic, dynamic>map = value.data() as Map;
        Image = map["Photo"];
        getcarousel();
        notifyListeners();
      }
    });
  }

  void Deletecarousel(id, BuildContext context) {
    db.collection("CAROUSEL").doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Delete Successfully"),
          backgroundColor: green,
        ));
    notifyListeners();
    getcarousel();
  }

  TextEditingController subcategoryct = TextEditingController();
  TextEditingController categorycontroler = TextEditingController();
  TextEditingController subCategoryAutoController = TextEditingController();

  String productSelectedcategoryid = "";
  bool Subcategorylodder = false;

  void addsubcategory(String from, String oldid) {
    Subcategorylodder = true;
    notifyListeners();
    String id = DateTime
        .now()
        .microsecondsSinceEpoch
        .toString();
    HashMap<String, dynamic>map = HashMap();
    map["Category_Name"] = categorycontroler.text;
    map["Category_Id"] = productSelectedcategoryid;
    map["SUBCATEGORY_NAME"] = subcategoryct.text;
    if (from == "NEW") {
      map["SubCategory_Id"] = id;
    }
    if (from == "EDIT") {
      db.collection("SUBCATEGORY").doc(oldid).update(map);
    } else {
      db.collection("SUBCATEGORY").doc(id).set(map);
    }
    Subcategorylodder = false;
    notifyListeners();
    getSubcategory();
    notifyListeners();
  }

  void Subcategoryclear() {
    subcategoryct.clear();
  }

  List<Subcategorymodel>Subcategorylist = [];
  List<Subcategorymodel>Subcategorylistuser = [];
  List<Subcategorymodel>subCategoryAutoCompleteList = [];


  bool Getsubcatlodder = false;

  void getSubcategory() {
    Getsubcatlodder = true;
    db.collection("SUBCATEGORY").get().then((value) {
      Getsubcatlodder = false;
      notifyListeners();
      if (value.docs.isNotEmpty) {
        Subcategorylist.clear();
        for (var element in value.docs) {
          Subcategorylist.add(Subcategorymodel(
            element.id, element.get("SUBCATEGORY_NAME").toString(),false));
          notifyListeners();
        };
      }
    });
    notifyListeners();
  }


  bool Getsubcatlodderuser = false;

  void getSubcategoryuser(String cateid) {
    Subcategorylistuser.clear();
    Getsubcatlodderuser = true;
    db.collection("SUBCATEGORY").where("Category_Id", isEqualTo: cateid)
        .get()
        .then((value) {
      Getsubcatlodderuser = false;
      notifyListeners();
      if (value.docs.isNotEmpty) {
        for (var element in value.docs) {
          Subcategorylistuser.add(Subcategorymodel(
            element.id, element.get("SUBCATEGORY_NAME").toString(),false));
          notifyListeners();
        };
      }
    });
    notifyListeners();
  }


  void Editsubcategory(String id) {
    db.collection("SUBCATEGORY").doc(id).get().then((value) {
      if (value.exists) {
        Map<dynamic, dynamic>map = value.data() as Map;
        // map["SUBCATEGORY_NAME"] = subcategoryct.text;
        subcategoryct.text = map["SUBCATEGORY_NAME"].toString();
        getSubcategory();
        notifyListeners();
      }
    });
    notifyListeners();
  }

  void Deletesubcategory(id, BuildContext context) {
    db.collection("SUBCATEGORY").doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Delete Successfully"),
          backgroundColor: green,
        ));
    notifyListeners();
    getSubcategory();
  }

  // call
  void makingPhoneCall(String Phone) async {
    String url = "";
    url = 'tel:$Phone';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  //whatsapp
  void whatsappLaunch({@required number, @required message}) async {
    if (number
        .toString()
        .length == 10) {
      number = "+91$number";
    }
    print(number.toString() + '  JH JNNNN');
    String url = "whatsapp://send?phone=$number&text=$message";
    await canLaunchUrl(Uri.parse(url))
        ? launchUrl(Uri.parse(url))
        : print("can't open whatsapp");
    // await canLaunchUrl(Uri.parse(url)) ? launchUrl(Uri.parse(url)) :print("can't open whatsapp");
    // whatsappLaunch(number:number,message: "Hello" );
  }


  // location
  // Position? currentPosition;
  // Future<bool> handleLocationPermission(Context) async {
  // //   bool serviceEnabled;
  //   LocationPermission permission;
  //
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     ScaffoldMessenger.of(Context).showSnackBar(const SnackBar(
  //         content: Text('Location services are disabled. Please enable the services')));
  //     return false;
  //   }
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       ScaffoldMessenger.of(Context).showSnackBar(
  //           const SnackBar(content: Text('Location permissions are denied')));
  //       return false;
  //     }
  //   }
  //   if (permission == LocationPermission.deniedForever) {
  //     ScaffoldMessenger.of(Context).showSnackBar(const SnackBar(
  //         content: Text(
  //             'Location permissions are permanently denied, we cannot request permissions.')));
  //     return false;
  //   }
  //   return true;
  // }
  // Future<void> getCurrentPosition(BuildContext context) async {
  //   print("hgshgdhdg");
  //   final hasPermission = await handleLocationPermission(context);
  //   if (!hasPermission) return;
  //   await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
  //       .then((Position position) {
  //     currentPosition = position;
  //     print(currentPosition.toString()+"hhiiiiiiii");
  //   }).catchError((e) {
  //     debugPrint(e);
  //   });
  //   notifyListeners();
  // }
  File? Registerfileimage = null;
  String Registerimg = "";
  File? Workerfile;
  List<File>Workerlist = [];
  TextEditingController Namecontroller2 = TextEditingController();
  TextEditingController Experiencecontroller = TextEditingController();
  TextEditingController Agecontroller = TextEditingController();
  TextEditingController Mobilecontroller = TextEditingController();
  TextEditingController Whatsappcontroller = TextEditingController();
  TextEditingController Worktypecontroller = TextEditingController();
  TextEditingController Locationcontroller1 = TextEditingController();


  List<Map<String, dynamic>> items1 = [];


  String SetworkLocation = "";

  void SetWorkLocation() {
    SetworkLocation = Locationcontroller1.text;
    notifyListeners();
  }

  void loadJsonData1() async {
    String data = await rootBundle.loadString('assets/places.json');
    items = json.decode(data).cast<Map<String, dynamic>>();
    filteredItems.addAll(items);
    notifyListeners();
  }

  void filterItems1(String query) {
    final String lowerCaseQuery = query.toLowerCase();
    filteredItems = items.where((item) {
      final String itemName = item['name'].toLowerCase();
      return itemName.contains(lowerCaseQuery);
    }).toList();
    notifyListeners();
  }

  Future<void> workersRegistration(String type,String userid) async {
    String id = DateTime
        .now()
        .microsecondsSinceEpoch
        .toString();
    HashMap<String, dynamic>map = HashMap();
    List<String>Worker = [];
    map["STATUS"] = "REGISTERED";
    map["REGISTER_STATUS"] = "REQUESTED";
    map["USER_ID"] = userid;
    map["Worker_Name"] = Namecontroller2.text;
    map["Worker_ID"] = id;
    map["Worker_Experience"] = Experiencecontroller.text;
    map["Worker_Age"] = Agecontroller.text;
    map["Worker_Location"] = Locationcontroller1.text;
    map["Worker_Mobileno"] = Mobilecontroller.text;
    map["Worker_Whatsapno"] = Whatsappcontroller.text;
    map["Worker_Jobtype"] = subCategoryAutoController.text;
    map["TYPE"] = type;
    if (Registerfileimage != null) {
      String photoId = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(Registerfileimage!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          map["PHOTO"] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      map["PHOTO"] = Registerimg;
    }

    // HashMap<String, dynamic>map= HashMap();
    if (Workerlist.isNotEmpty) {
      print(Workerlist.length.toString() + 'okasjdioajsdoi');
      int k = 0;
      for (File i in Workerlist) {
        k++;
        String imgKey = "Image$k";
        String photoId = DateTime
            .now()
            .millisecondsSinceEpoch
            .toString();
        print(photoId + 'dddd');
        ref = FirebaseStorage.instance.ref().child(photoId);
        await ref.putFile(i).whenComplete(() async {
          await ref.getDownloadURL().then((value) {
            Worker.add(value); // Add each URL to dum list
            notifyListeners();
          });
          notifyListeners();
        });
      }
      notifyListeners();
    } else {}
    map['WORK_PHOTO'] = Worker;


    print("kjgbb");

      db.collection("REGISTRATION").doc(id).set(map);



    notifyListeners();
  }

  Future<void> contractorRegistration(String userid) async {
    String id = DateTime.now().microsecondsSinceEpoch.toString();
    HashMap<String, dynamic>map = HashMap();
    List<String>Worker = [];
    map["STATUS"] = "REGISTERED";
    map["USER_ID"] = userid;
    map["REGISTER_STATUS"] = "REQUESTED";
    map["Contractor_Name"] = Namecontroller2.text;
    map["Contractor_ID"] = id;
    map["Contractor_Experience"] = Experiencecontroller.text;
    map["Contractor_Age"] = Agecontroller.text;
    map["Contractor_Location"] = Locationcontroller1.text;
    map["Contractor_Mobileno"] = Mobilecontroller.text;
    map["Contractor_Whatsapno"] = Whatsappcontroller.text;
    map["Contractor_Jobtype"] = subCategoryAutoController.text;
    if (Registerfileimage != null) {
      String photoId = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(Registerfileimage!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          map["PHOTO"] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      map["PHOTO"] = Registerimg;
    }

    // HashMap<String, dynamic>map= HashMap();
    if (Workerlist.isNotEmpty) {
      print(Workerlist.length.toString() + 'okasjdioajsdoi');
      int k = 0;
      for (File i in Workerlist) {
        k++;
        String imgKey = "Image$k";
        String photoId = DateTime
            .now()
            .millisecondsSinceEpoch
            .toString();
        print(photoId + 'dddd');
        ref = FirebaseStorage.instance.ref().child(photoId);
        await ref.putFile(i).whenComplete(() async {
          await ref.getDownloadURL().then((value) {
            Worker.add(value); // Add each URL to dum list
            notifyListeners();
          });
          notifyListeners();
        });
      }
      notifyListeners();
    } else {}
    map['WORK_PHOTO'] = Worker;
    db.collection("CONTRACTORS").doc(id).set(map);
    notifyListeners();
  }

  Future getImggalleryreg() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropImagereg(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future getImgcamerareg() async {
    final imgPicker = ImagePicker();
    final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      cropImagereg(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future<void> cropImagereg(String path, String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      Registerfileimage = File(croppedFile.path);
      print(Registerfileimage.toString() + "fofiifi");
      notifyListeners();
    }
    notifyListeners();
  }

  Future getImggalleryreg1() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropImagereg1(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future getImgcamerareg1() async {
    final imgPicker = ImagePicker();
    final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      cropImagereg1(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future<void> cropImagereg1(String path, String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9

      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      Workerfile = File(croppedFile.path);
      Workerlist.add(Workerfile!);
      print(Workerfile.toString() + "fofiifi");
      notifyListeners();
    }
    notifyListeners();
  }

  List <Registrationmodel>RegistrationList= [];

  void getWorkerRegistration() {
    db.collection("REGISTRATION").where("REGISTER_STATUS",isEqualTo: "REQUESTED").get().then((value) {
      RegistrationList.clear();
      if (value.docs.isNotEmpty) {
        for (var element in value.docs) {
          Map<dynamic, dynamic> getmap = element.data();
          RegistrationList.add(Registrationmodel(
            element.id,
            getmap["Worker_Name"].toString(),
            getmap["Worker_Age"].toString(),
            getmap["Worker_Experience"].toString(),
            getmap["Worker_Mobileno"].toString(),
            getmap["Worker_Whatsapno"].toString(),
            getmap["Worker_Location"].toString(),
            getmap["PHOTO"].toString(),
            getmap["Worker_Jobtype"].toString(),
            getmap["WORK_PHOTO"],
          ));
        }

        notifyListeners();
      }
      notifyListeners();
    });
  }

  void WorkerAccept(String id, from, context) {
    db.collection("REGISTRATION").doc(id).set(
        {"REGISTER_STATUS": from}, SetOptions(merge: true));
      if (from == "APPROVED") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Worker Approved successfuly"),
          backgroundColor: Colors.green,));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Worker rejected successfuly"), backgroundColor: Colors.red,));
      }
      notifyListeners();
    }

  void UsergetWorkerRegistration() {
    db.collection("REGISTRATION").where("REGISTER_STATUS",isEqualTo: "APPROVED").get().then((value) {
      RegistrationList.clear();
      if (value.docs.isNotEmpty) {
        for (var element in value.docs) {
          Map<dynamic, dynamic> getmap = element.data();
          RegistrationList.add(Registrationmodel(
            element.id,
            getmap["Worker_Name"].toString(),
            getmap["Worker_Age"].toString(),
            getmap["Worker_Experience"].toString(),
            getmap["Worker_Mobileno"].toString(),
            getmap["Worker_Whatsapno"].toString(),
            getmap["Worker_Location"].toString(),
            getmap["PHOTO"].toString(),
            getmap["Worker_Jobtype"].toString(),
            getmap["WORK_PHOTO"],
          ));
        }

        notifyListeners();
      }
      notifyListeners();
    });
  }
  // Function for selecting location and worktype..

  void UsergetWorkerRegistrationSelected(String jobType,String location) {
    db.collection("REGISTRATION").where("REGISTER_STATUS",isEqualTo: "APPROVED").where("Worker_Jobtype",isEqualTo:jobType).where("Worker_Location",isEqualTo:location ).get().then((value) {
      RegistrationList.clear();
      if (value.docs.isNotEmpty) {
        for (var element in value.docs) {
          Map<dynamic, dynamic> getmap = element.data();
          RegistrationList.add(Registrationmodel(
            element.id,
            getmap["Worker_Name"].toString(),
            getmap["Worker_Age"].toString(),
            getmap["Worker_Experience"].toString(),
            getmap["Worker_Mobileno"].toString(),
            getmap["Worker_Whatsapno"].toString(),
            getmap["Worker_Location"].toString(),
            getmap["PHOTO"].toString(),
            getmap["Worker_Jobtype"].toString(),
            getmap["WORK_PHOTO"],
          ));
          print(RegistrationList.length.toString()+"sdjfhdfs");
        }

        notifyListeners();
      }
      notifyListeners();
    });
  }

  void EditUsergetWorkerRegistration(String userid) {
    db.collection("REGISTRATION").where("USER_ID",isEqualTo:userid ).get().then((value) {
      RegistrationList.clear();
      if (value.docs.isNotEmpty) {
        for (var element in value.docs) {
          Map<dynamic, dynamic> getmap = element.data();
          RegistrationList.add(Registrationmodel(
            element.id,
            getmap["Worker_Name"].toString(),
            getmap["Worker_Age"].toString(),
            getmap["Worker_Experience"].toString(),
            getmap["Worker_Mobileno"].toString(),
            getmap["Worker_Whatsapno"].toString(),
            getmap["Worker_Location"].toString(),
            getmap["PHOTO"].toString(),
            getmap["Worker_Jobtype"].toString(),
            getmap["WORK_PHOTO"],
          ));
          print(RegistrationList.length.toString()+"sdjfhdfs");
        }

        notifyListeners();
      }
      notifyListeners();
    });
  }
  void changeColors(int indexvalue) {
    if (Subcategorylistuser.isNotEmpty && indexvalue >= 0 && indexvalue < Subcategorylistuser.length) {
      for (int i = 0; i < Subcategorylistuser.length; i++) {
        Subcategorylistuser[i].changecolor = (i == indexvalue);
      }
      notifyListeners(); // Assuming this function notifies the listeners about the changes
    } else {
      print('Invalid index value or empty list');
    }
  }
  }


