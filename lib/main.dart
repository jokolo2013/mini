import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mini/screen/food.dart';
import 'package:mini/screen/home.dart';
import 'package:mini/screen/managerfood.dart';
import 'package:mini/screen/user.dart';
import 'dart:ffi';

Future<void> main() async {

   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePageWidget(), routes: {
      'Food': (context) => FoodDetailWidget(),
      'User': (context) => UserDetailWidget(),
      'Manage': (context) => Managerfood(),
    });
  }
}
