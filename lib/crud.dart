import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
FirebaseFirestore firestore=FirebaseFirestore.instance;
class crud extends StatefulWidget {
  const crud({Key? key}) : super(key: key);
  @override
  State<crud> createState() => _crudState();
}
class _crudState extends State<crud> {
  void create()async{
    try{
      await firestore.collection('user').doc('testuser').set({
        'firstname':'john',
        'lastname':'peter',
        'age':'25',
      });
    }catch(e){
      print(e);
    }
  }
  void update() async {
    try {
      firestore.collection('user').doc('testuser').update({
        'firstname': 'deric',
        'age': '27',
      });
    } catch (e) {
      print(e);
    }
  }
  void read()async{
    DocumentSnapshot documentSnapshot;
    try {
      documentSnapshot =
      await firestore.collection('user').doc('testuser').get();
      print(documentSnapshot.data());
    }catch(e) {
      print(e);
    }
    }
    void delete()async{
    try{
      firestore.collection('user').doc('testuser').delete();
    }catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.tealAccent,
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 80,
              ),
              TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {
                    create();
                  },
                  child: Text('CREATE')),
              SizedBox(height: 40,
              ),
              TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {
                    read();
                  },
                  child: Text('READ')),
              SizedBox(height: 40),
              TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {
                    update();
                  },
                  child: Text('UPDATE')),
              SizedBox(height: 40),
              TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {
                    delete();
                  },
                  child: Text('DELETE')),
            ],
          ),
        ));
  }
}