import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:crud/crud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: crud()));
}


