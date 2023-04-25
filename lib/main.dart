import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_keep_it/screen/lock_screen.dart';
import 'screen/UI.dart';
import 'package:hive/hive.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('passwordHive');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink),
      ),
      home: UI(),
    );
  }
}
