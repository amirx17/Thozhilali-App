import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thzhilali/ADMIN/AdminHomeScreen.dart';
import 'package:thzhilali/PROVIDER/loginprovider.dart';
import 'package:thzhilali/PROVIDER/mainprovider.dart';
import 'package:thzhilali/USER/Home_Screen.dart';
import 'package:thzhilali/USER/splash%20_screen.dart';

import 'PROVIDER/homeprovider.dart';

import 'USER/Bottom_screen.dart';
import 'USER/login_Screen.dart';
import 'USER/profile_screen.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [

        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        // ChangeNotifierProvider(create: (context) => MainProvider()),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,

        ),
        home:splashScreen(),
        // home:home(),
      ),
    );
  }
}
