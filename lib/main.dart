import 'package:agenda_contatos/Screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

main(List<String> args) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.indigo,
      statusBarColor: Colors.indigo[300],
      statusBarBrightness: Brightness.light));

  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}
