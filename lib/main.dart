import 'package:chapter_1/utilits/routes.dart';
import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      initialRoute: 'home_page',
      routes: {
        MyRoute.homepage: (context) => home_page(),
        MyRoute.loginpage: (context) => login_page(),
        },
      title: 'Flutter Project',
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(primarySwatch: Colors.red,brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
    ),
  );
}
