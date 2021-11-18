import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini/config/constant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mini/screen/home.dart';

class FirebaseLogin extends StatefulWidget {
  const FirebaseLogin({Key key}) : super(key: key);

  @override
  _FirebaseLoginState createState() => _FirebaseLoginState();
}

class _FirebaseLoginState extends State<FirebaseLogin> {
  var email, password;
  final formKey = GlobalKey<FormState>();

  Future<void> checkUser() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        print('Success');
        print(value);
        MaterialPageRoute materialPageRoute = MaterialPageRoute(
            builder: (BuildContext context) => HomePageWidget());
        Navigator.of(context).pushAndRemoveUntil(
            materialPageRoute, (Route<dynamic> route) => false);
      }).catchError((onError) {
        print(onError);
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: formKey,
        child: Container(
          color: p2Color,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: size.height * 0.05,
                ),
                Image.asset(
                  "assets/images/logo.png",
                  width: size.width * 0.5,
                ),
                Text(
                  'เข้าสู่ระบบ',
                  style: TextStyle(fontSize: 40, color: whiColor),
                ),
                SizedBox(
                  height: size.height * 0.08,
                ),
                Container(
                  color: whiColor,
                  width: size.width * 0.9,

                  /*   child:  Text('Email',
                     textAlign: TextAlign.right, 
                     
                style: TextStyle(fontSize: 25, color: whiColor,)
                
                ),);*/

                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.black, fontSize: 20,

                      //  decorationColor: Colors.white,
                      //  backgroundColor: Colors.white
                    ),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: pColor,
                        size: size.height * 0.05,
                      ),
                      hintText: "Email",
                    ),
                    onSaved: (value) {
                      email = value.trim();
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Container(
                  width: size.width * 0.9,
                  color: whiColor,
                  child: TextFormField(
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock,
                        color: pColor,
                        size: size.height * 0.05,
                      ),
                      hintText: "Password",
                    ),
                    onSaved: (value) {
                      password = value.trim();
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Container(
                  width: size.width * 0.9,
                  height: size.height * 0.08,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.5),
                        side: BorderSide(color: whiColor)),
                    onPressed: () async {
                      formKey.currentState.save();
                      print(formKey.currentContext);
                      try {
                        await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: email, password: password)
                            .then((value) {
                          print('Success');
                          print(value);
                           MaterialPageRoute materialPageRoute =
                              MaterialPageRoute(
                                   builder: (BuildContext context) =>
                                       HomePageWidget());
                           Navigator.of(context).pushAndRemoveUntil(
                               materialPageRoute,
                              (Route<dynamic> route) => false);
                        }).catchError((onError) {
                          print(onError);
                        });
                      } catch (e) {
                        print(e);
                      }
                      //checkUser();
                    },
                    color: p2Color,
                    textColor: Colors.white,
                    child: Text("login".toUpperCase(),
                        style: TextStyle(fontSize: 16)),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Container(
                  // width: size.width * 0.6,
                  // height: size.height * 0.04,
                  child: RaisedButton(
                    /*  shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.5),
                        side: BorderSide(color: whiColor)),*/
                    onPressed: () {
                      Navigator.pushNamed(context, 'Register');
                    },
                    textColor: Colors.white,
                    child:
                        Text("ถ้ายังไม่มีบัญชีสมัครได้ที่นี้ ?".toUpperCase(),
                            style: TextStyle(
                              fontSize: 16,
                              color: sColor,
                            )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
