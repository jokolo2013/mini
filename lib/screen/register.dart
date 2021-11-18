import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mini/config/constant.dart';
import 'login.dart';

class FirebaseRegister extends StatefulWidget {
  const FirebaseRegister({Key key}) : super(key: key);

  @override
  _FirebaseRegisterState createState() => _FirebaseRegisterState();
}

class _FirebaseRegisterState extends State<FirebaseRegister> {
  var name, surname, email, password;
  String fullname;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: pColor,
        appBar: AppBar(
          title: Text('Firebase Register'),
          backgroundColor: pColor,
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  width: 200,
                  height: 200,
                ),
                Text(
                  'สมัครสมาชิก',
                  style: TextStyle(
                    color: whiColor,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Text(
                  'ชื่อ                                                    ',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: whiColor,
                    fontSize: 25,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                txtName(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'นามสกุล                                               ',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: whiColor,
                    fontSize: 25,
                    //   fontWeight: FontWeight.bold,
                  ),
                ),
                txtSurname(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Email                                                  ',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: whiColor,
                    fontSize: 25,
                    //    fontWeight: FontWeight.bold,
                  ),
                ),
                txtMail(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'รหัสผ่าน                                              ',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: whiColor,
                    fontSize: 25,
                    //     fontWeight: FontWeight.bold,
                  ),
                ),
                txtPassword(),
                SizedBox(
                  height: 15,
                ),
                txtConPassword(),
                SizedBox(
                  height: 15,
                ),
                btnSubmit(),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: p2Color,
                    //padding: EdgeInsets.fromLTRB(130, 12, 130, 12),
                    shape: StadiumBorder(),
                  ),
                  child: Text(
                    "หากมีบัญชีนี้อยู่แล้ว ?",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    print("to Login");
                    Navigator.pushNamed(context, 'Home');
                  },
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget txtName() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 20, 10),
      child: TextFormField(
        style: TextStyle(
          fontSize: 18,
          color: pColor,
        ),
        decoration: InputDecoration(
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: new BorderSide(),
          ),
          fillColor: Colors.white,
          filled: true,
          labelText: "Name",
          icon: Icon(
            Icons.account_circle_outlined,
            color: whiColor,
          ),
          hintText: 'Input your name',
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'กรุณาใส่ข้อมูลด้วย';
          } else if (value.length < 2) {
            return 'กรุณาใส่ข้อมูลมากกว่า 2 ตัวอักษร';
          }
        },
        onSaved: (value) {
          name = value;
        },
      ),
    );
  }

  Widget txtSurname() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 20, 10),
      child: TextFormField(
        style: TextStyle(
          fontSize: 18,
          color: pColor,
        ),
        decoration: InputDecoration(
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: new BorderSide(),
          ),
          fillColor: Colors.white,
          filled: true,
          labelText: "Surname",
          icon: Icon(Icons.account_circle_rounded, color: whiColor),
          hintText: 'Input your Surname',
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'กรุณากรอกข้อมูล';
          } else if (value.length < 2) {
            return 'กรุณาใส่ข้อมูลมากกว่า 2 ตัวอักษร';
          }
        },
        onSaved: (value) {
          surname = value.trim();
        },
      ),
    );
  }

  Widget txtMail() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 20, 10),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          fontSize: 18,
          color: pColor,
        ),
        decoration: InputDecoration(
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: new BorderSide(),
          ),
          fillColor: Colors.white,
          filled: true,
          labelText: "Email",
          icon: Icon(
            Icons.markunread_outlined,
            color: whiColor,
          ),
          hintText: 'Input your Email',
        ),
        validator: (value) {
          if (!(value.contains('@'))) {
            return 'กรุณากรอกข้อมูลตามรูปแบบอีเมลด้วย xxxx@xxx.xxx';
          } else if (!(value.contains('.'))) {
            return 'กรุณากรอกข้อมูลตามรูปแบบอีเมลด้วย .xxx';
          }
        },
        onSaved: (value) {
          email = value;
        },
      ),
    );
  }

  Widget txtPassword() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 20, 10),
      child: TextFormField(
        obscureText: true,
        style: TextStyle(
          fontSize: 18,
          color: pColor,
        ),
        decoration: InputDecoration(
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: new BorderSide(),
          ),
          fillColor: Colors.white,
          filled: true,
          labelText: "Password",
          icon: Icon(
            Icons.password_outlined,
            color: whiColor,
          ),
          hintText: 'Input your Password',
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'กรุณากรอกรหัสผ่าน';
          } else if (value.length < 6) {
            return 'รหัสผ่านต้องมากกว่า 6 ตัวอักษร';
          }
        },
        onChanged: (value) => password = value,
      ),
    );
  }

  Widget txtConPassword() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 20, 10),
      child: TextFormField(
        obscureText: true,
        style: TextStyle(
          fontSize: 18,
          color: pColor,
        ),
        decoration: InputDecoration(
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: new BorderSide(),
          ),
          fillColor: Colors.white,
          filled: true,
          labelText: "Current Password",
          icon: Icon(Icons.password_outlined),
          hintText: 'Input your Password',
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'กรุณากรอกรหัสผ่าน';
          } else if (value != password) {
            return 'รหัสผ่านไม่ตรงกัน';
          }
        },
        onSaved: (value) {
          password = value;
        },
      ),
    );
  }

  Widget btnSubmit() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: p2Color,
          padding: EdgeInsets.fromLTRB(170, 12, 170, 12),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.50),
              side: BorderSide(color: whiColor)),
        ),
        onPressed: () {
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
            fullname = name + ' '+ surname;
            print(fullname);
            registerFirebase();
          }
        },
        child: Text("Register"),
      );
  Future<void> registerFirebase() async {
    try {
      //ส่งข้อมูล Email และ password to firebase
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
               email: email, password: password)
          .then((value) {
        MaterialPageRoute materialPageRoute = MaterialPageRoute(
            builder: (BuildContext context) => FirebaseLogin());
        Navigator.of(context).pushAndRemoveUntil(
            materialPageRoute, (Route<dynamic> route) => false);
        print(materialPageRoute);
      }).catchError((onError) {
        print(onError);
        var msg = '${onError}';
        showAlert(msg);
      });
    } catch (e) {
      print(e);
    }
  }

  void showAlert(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: ListTile(
              leading: Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 48,
              ),
              title: Text(
                "พบข้อผิดพลาด",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 36,
                ),
              ),
            ),
            content: Text(message),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("ปิด"),
              )
            ],
          );
        });
  }
  
}
