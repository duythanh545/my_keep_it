import 'package:flutter/material.dart';
import 'package:my_keep_it/screen/lock_screen.dart';
import 'screen/UI.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink),
      ),
      home:  flag ? LockScreen() : UI(),
    );
  }
}
