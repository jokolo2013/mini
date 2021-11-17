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
  //ประกาศตัวแปรอ้างไปยัง Child ที่ต้องการ
  final dbfirebase = FirebaseDatabase.instance.reference().child('Store');

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
                  leading: CircleAvatar(
                    child: Image.network('${snapshot.value['path']}'),
                    backgroundColor: pColor,
                  ),
                  title: Text('${snapshot.value['name']}'),
                  subtitle: Row(
                    children: [
                    //  Text("ราคา" + '${snapshot.value['price']}'),
                      Text("รายละเอียด" + '${snapshot.value['detail']}'),
                    ],
                    
                  ),
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
                          updateData(snapshot.key);
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
