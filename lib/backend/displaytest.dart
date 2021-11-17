import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:mini/config/constant.dart';
import 'package:mini/flutter_flow/flutter_flow_theme.dart';

class Display extends StatefulWidget {
  const Display({Key key}) : super(key: key);

  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  final dbfirebase = FirebaseDatabase.instance.reference().child('Food');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FirebaseAnimatedList(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
          query: dbfirebase,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animetion, int index) {
            // var x = snapshot.value['product'];
            // print(x);
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'Food',
                    arguments: sendOneKey(snapshot.key.toString()));
                print(snapshot.key.toString());
              },
              //padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
              child: SingleChildScrollView(
                padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                      ),
                      child: Stack(
                        children: [
                          Image.network(
                            '${snapshot.value['path']}',
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.25,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            margin:
                                EdgeInsetsDirectional.fromSTEB(10, 120, 0, 0),
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Text(
                              '${snapshot.value['name']}',
                              style: FlutterFlowTheme.title2.override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.tertiaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
