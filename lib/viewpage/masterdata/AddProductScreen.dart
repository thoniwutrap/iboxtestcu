import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart' as fs;


class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text("fdsf"),
        onPressed: (){
          fs.Firestore store = fb.firestore();
          fs.CollectionReference ref = store.collection("books");
          ref.onSnapshot.listen((querySnapshot) {
            querySnapshot.docs.forEach((doc) {
              print("--------");
              print(doc.data());  // this works!!
            });
          });
        },
      )
    );
  }



}
