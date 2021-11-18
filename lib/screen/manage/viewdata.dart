import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mini/config/constant.dart';

class ViewData extends StatefulWidget {
  //const ViewData({Key? key}) : super(key: key);

  @override
  _ViewDataState createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {
  String keyfood;
  //ประกาศตัวแปรอ้างไปยัง Child ที่ต้องการ
  final dbfirebase = FirebaseDatabase.instance.reference().child('Food');

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
    final keyIn = ModalRoute.of(context).settings.arguments as sendOneKey;
    Size size = MediaQuery.of(context).size;
    String snapKey;
    return Flexible(
      child: FirebaseAnimatedList(
        query: dbfirebase,
        itemBuilder: (context, snapshot, animetion, index) {
          return Container(
            child: Padding(
              padding: EdgeInsets.all(4.0),
              child: Card(
                elevation: 5,
                child: ListTile(
                  leading: Card(
                    child: Image.network('${snapshot.value['path']}'),
                  ),
                  title: Text('${snapshot.value['name']}'),
                  trailing: Column(
                    children: [
                      Expanded(
                        child: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            print("Delete Data");
                            dbfirebase.child(snapshot.key).remove();
                          },
                        ),
                      ),
                      Expanded(
                          child: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          print("Edit");
                          print(snapshot.key);
                          print(keyfood);
                          // updateData(snapshot.key);
                          Navigator.pushNamed(
                            context,
                            'EditData',
                            arguments: sendTwoKey3Property(
                              snapshot.key,
                              snapshot.value['name'],
                              snapshot.value['detail'],
                              snapshot.value['path'],
                            ),
                          );
                        },
                      ))
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
