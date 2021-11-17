import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserDetailWidget extends StatefulWidget {
  UserDetailWidget({Key  key}) : super(key: key);

  @override
  _UserDetailWidgetState createState() => _UserDetailWidgetState();
}

class _UserDetailWidgetState extends State<UserDetailWidget> {
  dynamic textController1;
  dynamic textController2;
  dynamic textController3;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF1E5128),
        automaticallyImplyLeading: true,
        title: Text(
          'ข้อมูลผู้ใช้งาน',
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
              ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(120, 20, 0, 0),
                        child: Container(
                          width: 120,
                          height: 120,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            'https://picsum.photos/seed/715/600',
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 2, 0),
                          child: TextFormField(
                            controller: textController1,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'ชื่อ',
                              hintStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Color(0xFF1E5128),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.tertiaryColor,
                            ),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFF1E5128),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 2, 0),
                          child: TextFormField(
                            controller: textController2,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'สกุล',
                              hintStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Color(0xFF1E5128),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.tertiaryColor,
                            ),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFF1E5128),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: TextFormField(
                            controller: textController3,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: FlutterFlowTheme.bodyText1,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            style: FlutterFlowTheme.bodyText1,
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
