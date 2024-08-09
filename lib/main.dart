import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import 'screens/api_info_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'cxcxc SheetDB App',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      routes: {
        "/login": (BuildContext context) => LoginScreen(),
        "/API_Info": (BuildContext context) => ApiInfoScreen()
      },
      initialRoute: "/login",
    );
  }
}