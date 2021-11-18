import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mini/config/constant.dart';
import 'package:path/path.dart';

class EditData extends StatefulWidget {
  const EditData({Key key}) : super(key: key);

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  FirebaseStorage storage = FirebaseStorage.instance;
  String name, imgURL;
  String names, detailp, path;
  final formKey = GlobalKey<FormState>();

  final picker = ImagePicker();
  File imageFile;
  String urll;

  var file;
  String fileName;

//set data to firebase
  final dbfirebase = FirebaseDatabase.instance.reference().child('Food');

  Future<void> updateData(
    String sKey,
    dynamic db,
    String name,
    String detail,
    String path,
    dynamic context,
  ) async {
    try {
      await db.child(sKey).update({
        'name': names,
        'detail': detail,
        'path': path,
      }).then((value) {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Edit Group Success'),
            content: const Text('You Edit Data Success'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 'OK');
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }).catchError((onError) {
        print(onError.code);
        print(onError.massage);
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> openCamera() async {
    var picker = ImagePicker();
    var photo = await picker.pickImage(source: ImageSource.camera);

    try {
      fileName = basename(photo.path);
      setState(() {
        if (photo != null) {
          file = File(photo.path);
          print(fileName);
          print(file);
        } else {
          print('No image selected.');
        }
      });
    } catch (e) {}

    print(file);
  }

  Future<void> openGallery() async {
    var picker = ImagePicker();
    var photo = await picker.pickImage(source: ImageSource.gallery);

    try {
      fileName = basename(photo.path);
      setState(() {
        if (photo != null) {
          file = File(photo.path);
          print(fileName);
          print(file);
        } else {
          print('No image selected.');
        }
      });
    } catch (e) {}

    print(file);
  }

  @override
  dynamic keyfood;
  final dbFirebase = FirebaseDatabase.instance.reference().child("Food");

  Widget build(BuildContext context) {
    final keyIn =
        ModalRoute.of(context).settings.arguments as sendTwoKey3Property;
    Size size = MediaQuery.of(context).size;
    final dbFirebase = FirebaseDatabase.instance.reference().child('Food');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('แก้ไขรายการ'),
          backgroundColor: Color(0xFF1E5128),
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                showFile(keyIn.path),
                txtName(keyIn.name),
                //   txtPrice(),
                txtStatus(keyIn.details),
                filePicture(),
                selectPicture(),
                btnSubmit(
                  keyIn.sKey,
                  dbFirebase,
                  names,
                  detailp,
                  keyIn.path,
                  context,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget txtName(String value) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 20, 10),
      child: TextFormField(
        style: TextStyle(
          fontSize: 18,
          color: pColor,
        ),
        decoration: InputDecoration(
          labelText: "ชื่อเมนู:",
          icon: Icon(Icons.food_bank),
          hintText: 'กรอกชื่อเมนู',
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'กรุณาใส่ข้อมูลด้วย';
          } else if (value.length < 2) {
            return 'กรุณาใส่ข้อมูลมากกว่า 2 ตัวอักษร';
          }
        },
        initialValue: value,
        onSaved: (String value) {
          names = value;
        },
      ),
    );
  }

  Widget filePicture() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: pColor,
        ),
        onPressed: () {
          openCamera();
        },
        child: Stack(
          children: [
            Icon(Icons.camera),
          ],
        ),
      );

  Widget selectPicture() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: pColor,
        ),
        onPressed: () {
          openGallery();
        },
        child: Stack(
          children: [
            Icon(Icons.add_photo_alternate),
          ],
        ),
      );

  Widget showFile(String value) {
    return Container(
      child: Image.network(value),
    );
  }

  Widget txtPrice() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 20, 10),
      child: TextFormField(
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 18,
          color: pColor,
        ),
        decoration: InputDecoration(
          labelText: "Price",
          icon: Icon(Icons.price_change),
          hintText: 'Input your Product Price ',
        ),
        validator: (value) {},
        onSaved: (value) {
          //price = value;
        },
      ),
    );
  }

  Widget txtStatus(String value) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 20, 10),
      child: TextFormField(
        minLines:
            6, // any number you need (It works as the rows for the textarea)
        keyboardType: TextInputType.multiline,
        maxLines: null,
        style: TextStyle(
          fontSize: 18,
          color: pColor,
        ),
        decoration: InputDecoration(
          labelText: "รายละเอียด:",
          icon: Icon(Icons.description),
          hintText: 'กรอกวัตถุดิบ และ วิธีทำอาหาร',
        ),
        initialValue: value,
        validator: (value) {
          if (value.isEmpty) {
            return 'กรุณากรอกรายละเอียด';
          } else if (value.length < 1) {
            return 'รายละเอียดต้องมากกว่า 1 ตัวอักษร';
          }
        },
        onSaved: (String value) => detailp = value,
      ),
    );
  }

  Widget btnSubmit(
    String sKey,
    dynamic db,
    String name,
    String detail,
    String path,
    dynamic context,
  ) =>
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: pColor,
        ),
        onPressed: () {
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
            print(names);
            print(detail);
            print(file);
            print(fileName);
            updateData(
              sKey,
              db,
              names,
              detailp,
              path,
              context,
            );
            formKey.currentState.reset();
          }
        },
        child: Text("Submit"),
      );
}
