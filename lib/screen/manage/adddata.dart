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
    var picker = ImagePicker();
    var photo = await picker.pickImage(source: ImageSource.camera);

    try {
      setState(() {
        fileName = basename(photo.path);
        if (photo != null) {
          file = File(photo.path);
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
        } else {
          print('No image selected.');
        }
      });
    } catch (e) {}

    print(file);
  }

//set image
  Future<void> uploadimage(
    dynamic context,
    dynamic fileName,
    dynamic db,
  ) async {
    if (file != null) {
      try {
        TaskSnapshot snapshot =
            await storage.ref().child("files/$fileName").putFile(file);
        if (snapshot.state == TaskState.success) {
          final String downloadUrl = await snapshot.ref.getDownloadURL();
          urll = downloadUrl;
          print(downloadUrl);
          await dbfirebase.push().set({
            'name': names,
            'detail': detail,
            'path': urll,
          }).then((value) {
            print(urll);
            print("Sucess");
          }).catchError((onError) {
            print(onError.code);
            print(onError.message);
          });
        } else {
          print('Error from image repo ${snapshot.state.toString()}');
          throw ('This file is not an image');
        }
      } on FirebaseException catch (error) {
        print(error);
      }
    }
  }

//set data to firebase
  final dbfirebase = FirebaseDatabase.instance.reference().child('Food');

  Future<void> createData() async {
    try {
      await dbfirebase.push().set({
        'name': names,
        'detail': detail,
        'path': urll,
      }).then((value) {
        print(urll);
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
          labelText: "????????????????????????:",
          icon: Icon(Icons.food_bank),
          hintText: '????????????????????????????????????',
        ),
        validator: (value) {
          if (value.isEmpty) {
            return '??????????????????????????????????????????????????????';
          } else if (value.length < 2) {
            return '??????????????????????????????????????????????????????????????? 2 ????????????????????????';
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
          labelText: "??????????????????????????????:",
          icon: Icon(Icons.description),
          hintText: '???????????????????????????????????? ????????? ?????????????????????????????????',
        ),
        validator: (value) {
          if (value.isEmpty) {
            return '?????????????????????????????????????????????????????????';
          } else if (value.length < 1) {
            return '??????????????????????????????????????????????????????????????? 1 ????????????????????????';
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
            uploadimage('', fileName, dbfirebase);
            //createData();
            formKey.currentState.reset();
          }
        },
        child: Text("Submit"),
      );
}
