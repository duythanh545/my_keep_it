import 'package:flutter/material.dart';
import 'package:my_keep_it/main.dart';
import 'package:my_keep_it/setting.dart';

import '../action_keep_it/add_page.dart';
import '../action_keep_it/note.dart';
import 'package:my_keep_it/action_keep_it/add_page.dart';

class UI extends StatefulWidget {
  const UI({Key? key}) : super(key: key);

  @override
  State<UI> createState() => _UIState();
}
class _UIState extends State<UI> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'My keep it',
            textAlign: TextAlign.left,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Add(),
                      ));
                },
                icon: Icon(
                  Icons.add,
                  size: 30,
                )),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Settings(),
                      ));
                },
                icon: Icon(Icons.settings)),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: const <Widget>[

            ],
          ),
        ),
      ),
    );
  }
}
