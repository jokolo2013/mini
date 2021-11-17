import 'dart:ffi';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:mini/backend/displaytest.dart';
import 'package:mini/flutter_flow/flutter_flow_theme.dart';

class ViewMenu extends StatefulWidget {
  //const ViewMenu({ Key? key }) : super(key: key);

  @override
  _ViewMenuState createState() => _ViewMenuState();
}

class _ViewMenuState extends State<ViewMenu> {
  //ประกาศตัวแปรอ้างไปยัง Child ที่ต้องการ
  final dbfirebase = FirebaseDatabase.instance.reference().child('Store');

  //Function Edit Data
  Future<void> updateData(String key) async {
    try {
      await dbfirebase
          .child(key)
          .update({
            'status': "ขายแล้ว",
          })
          .then((value) => print("Success"))
          .catchError((onError) {
            print(onError.code);
            print(onError.message);
          });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
          return Align(
            alignment: AlignmentDirectional(0, 0),
            child: ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              children: [
                Display(),
              ],
            ),
          );
  }
}
