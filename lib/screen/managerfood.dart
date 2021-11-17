import 'package:flutter/material.dart';
import 'package:mini/config/constant.dart';

import 'manage/adddata.dart';
import 'manage/viewdata.dart';

class Managerfood extends StatefulWidget {
  const Managerfood({ Key key }) : super(key: key);

  @override
  _ManagerfoodState createState() => _ManagerfoodState();
}

class _ManagerfoodState extends State<Managerfood> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Manage Food"),
          backgroundColor: pColor,
        ),
        body: TabBarView(
          children: [
            AddData(),
            ViewData(),
          ],
        ),
        bottomNavigationBar: Container(
          color: pColor,
          child: TabBar(
            indicatorColor: Colors.redAccent,
            labelColor: Colors.white,
            tabs: [
              Tab(
                text: "AppData",
              ),
              Tab(
                text: "View Data",
              )
            ],
          ),
        ),
      ),
    );
  }
}