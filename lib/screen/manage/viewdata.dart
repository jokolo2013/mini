import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
    final dbfirebase = FirebaseDatabase.instance.reference().child('Food');
    final keyIn = ModalRoute.of(context).settings.arguments as sendOneKey;
    Size size = MediaQuery.of(context).size;
    String snapKey;
    return Flexible(
      child: FirebaseAnimatedList(
        query: dbfirebase,
        itemBuilder: (context, snapshot, animetion, index) {
          return Container(
            child: Container(
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
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          icon: Icon(
                            Icons.delete,
                            size: 15,
                          ),
                          onPressed: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Alert Delate Data'),
                                content: const Text(
                                    'Do You Want Delate Data press Ok for Delate'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text('Cancel'),
                                  ),
                                  //NOTE ปุ่ม ลบ
                                  TextButton(
                                    onPressed: () => {
                                      if (snapshot.value['path'] !=
                                          'null')
                                        {
                                          FirebaseStorage.instance
                                              .refFromURL(
                                                  snapshot.value['path'])
                                              .delete(),
                                          Navigator.pop(context, 'OK'),
                                          dbfirebase
                                              .child(snapshot.key)
                                              .remove(),
                                              print(snapshot.key)
                                        }
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Expanded(
                          child: IconButton(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        icon: Icon(
                          Icons.edit,
                          size: 15,
                        ),
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
