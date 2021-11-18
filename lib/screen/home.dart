import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mini/backend/displaytest.dart';
import 'package:mini/backend/viewMenu.dart';
import 'package:mini/config/constant.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  //HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

dynamic context;
Future<void> logout() async {
  await FirebaseAuth.instance.signOut();
  print("logout");
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
 // final keyIn = ModalRoute.of(context).settings.arguments as setEmail;
  @override
  Widget build(BuildContext context) {
  //  print(keyIn.email);
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: sColor,
              ),
              padding: EdgeInsetsDirectional.fromSTEB(100, 50, 0, 0),
              child: Text(
                'Menu',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'ข้อมูลผู้ใช้งาน',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              leading: Icon(
                Icons.account_circle,
                color: pColor,
                size: 36,
              ),
              onTap: () {
                Navigator.pushNamed(context, 'User');
              },
            ),
            ListTile(
              title: Text(
                'จัดการสูตรอาหาร',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              leading: Icon(
                Icons.food_bank,
                color: pColor,
                size: 36,
              ),
              onTap: () {
                Navigator.pushNamed(context, 'Manage');
              },
            ),
            ListTile(
              title: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              leading: Icon(
                Icons.logout,
                color: pColor,
                size: 36,
              ),
              onTap: () {
                logout();
                Navigator.of(context).pop();
                Navigator.pushNamed(context, 'Home', arguments: []);
              },
            ),
          ],
        ),
      ),
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF1E5128),
        automaticallyImplyLeading: true,
        title: Text(
          'หน้าแรก',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            color: Color(0xFFFFEAAF),
            fontSize: 20,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFF1E5128),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(120, 20, 0, 600),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 400),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'สูตรอาหารแนะนำ',
                        style: FlutterFlowTheme.title1.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.tertiaryColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -0.38),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Color(0xFFF5F5F5),
                        child: Stack(
                          children: [
                            Image.network(
                              'https://picsum.photos/seed/643/600',
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: MediaQuery.of(context).size.height * 0.15,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 90, 0, 0),
                              child: Text(
                                'สูตรอาหาร',
                                style: FlutterFlowTheme.subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.tertiaryColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Color(0xFFF5F5F5),
                        child: Stack(
                          children: [
                            Image.network(
                              'https://picsum.photos/seed/643/600',
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: MediaQuery.of(context).size.height * 0.15,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 90, 0, 0),
                              child: Text(
                                'สูตรอาหาร',
                                style: FlutterFlowTheme.subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.tertiaryColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                      child: Text(
                        'สูตรอาหารอื่น ๆ',
                        style: FlutterFlowTheme.title1.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.tertiaryColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Display()
            ],
          ),
        ),
      ),
    );
  }
}
