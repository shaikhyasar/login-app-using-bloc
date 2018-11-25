import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'provider.dart';

void main() {
  runApp(
    new Provider(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    )),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Login Using BLOC"),
      ),
      body: LoginScreen(),
    );
  }
}
