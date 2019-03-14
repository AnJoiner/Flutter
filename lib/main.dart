import 'package:flutter/material.dart';
import 'login.dart';
import 'tabbarroute.dart';
import 'scaffoldtest.dart';
import 'snacktest.dart';
import 'bottomnavigationbartroute.dart';
import 'animation.dart';
import 'dart:io';
import 'package:flutter/services.dart';

void main() {
  runApp(new MyApp());
  if (Platform.isAndroid) {
// 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFFF786E),
        primaryColorLight: Color(0xFFFF978F),
          accentColor: Color(0xFFFFFFFF)
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
        routes:{
          "scaffold_page":(context)=>ScaffoldTest(),
          "snack_page":(context)=> SnackTest(),
          "login_page":(context)=> LoginPage(),
        }
    );
  }
}

