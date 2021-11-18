import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mini/screen/editData.dart';
import 'package:mini/screen/food.dart';
import 'package:mini/screen/home.dart';
import 'package:mini/screen/login.dart';
import 'package:mini/screen/manage/viewdata.dart';
import 'package:mini/screen/managerfood.dart';
import 'package:mini/screen/register.dart';
import 'package:mini/screen/user.dart';
//import 'package:mini/screen/editedata.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FirebaseLogin(), routes: {
      'Food': (context) => FoodDetailWidget(),
      'User': (context) => UserDetailWidget(),
      'Manage': (context) => Managerfood(),
      'EditData' : (context) => EditData(),
      'Register' : (context) => FirebaseRegister(),
      'Home': (context) => FirebaseLogin(),
      'Index' : (context) => HomePageWidget(),
    });
  }
}
