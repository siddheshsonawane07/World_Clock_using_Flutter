import 'package:flutter/material.dart';
import 'package:flutterproject4/pages/home.dart';
import 'package:flutterproject4/pages/chose_location.dart';
import 'package:flutterproject4/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      "/": (context) => const Loading(),
      "/home": (context) => const Home(),
      "/location": (context) => const ChooseLocation(),
    },
  ));
}
