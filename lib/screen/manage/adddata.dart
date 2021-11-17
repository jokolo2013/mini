import 'dart:ffi';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mini/config/constant.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:path/path.dart' as path;
import 'package:path/path.dart';

class AddData extends StatefulWidget {
  //const AddData({Key? key}) : super(key: key);

  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {

  FirebaseStorage storage = FirebaseStorage.instance;
  String name, imgURL;
  String names, detail, path;
  final formKey = GlobalKey<FormState>();


  final picker = ImagePicker();
  File imageFile;
  String urll;

  var file;
  String fileName;

  

  Future<void> openCamera() async {
    PickedFile pickedImage;
    var photo = await picker.pickImage(source: ImageSource.camera);

    try {
       fileName = basename(pickedImage.path);
      setState(() {
        if (photo != null) {
          file = File(pickedImage.path);
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
      setState(() {
        if (photo != null) {
          file = File(photo.path);
        } else {
          print('No image selected.');
        }
      });
    } catch (e) {}

    print(file);
  }

//set image

//set data to firebase
  final dbfirebase = FirebaseDatabase.instance.reference().child('Store');

  Future<void> createData() async {
    try {
      await dbfirebase.push().set({
        'name': names,
        'detail': detail,
        'path': file,
      }).then((value) {
        print("Sucess");
      }).catchError((onError) {
        print(onError.code);
        print(onError.message);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                showFile(),
                txtName(),
                //   txtPrice(),
                txtStatus(),
                filePicture(),
                selectPicture(),
                btnSubmit(),
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
        onSaved: (value) {
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

  Widget showFile() {
    return Container(
      child: file == null ? Text('Not Found') : Image.file(file),
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

  Widget txtStatus() {
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
        validator: (value) {
          if (value.isEmpty) {
            return 'กรุณากรอกรายละเอียด';
          } else if (value.length < 1) {
            return 'รายละเอียดต้องมากกว่า 1 ตัวอักษร';
          }
        },
        onChanged: (value) => detail = value,
      ),
    );
  }

  Widget btnSubmit() => ElevatedButton(
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
            createData();
            formKey.currentState.reset();
          }
        },
        child: Text("Submit"),
      );
}
