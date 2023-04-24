import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_keep_it/screen/UI.dart';
import 'note.dart';

List<Note> listNote = [];

class Add extends StatelessWidget {
  Add({Key? key}) : super(key: key);
  String? title;
  String? content;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text('Add Page'),
              actions: [
                IconButton(
                    onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              title: Text('Save it!'),
                              content: Text('Do you want to save?'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Cancel')),
                                TextButton(
                                    onPressed: () {}, child: Text('Save'))
                              ],
                            )),
                    icon: Icon(Icons.save)),
                SizedBox(width: 10),
              ],
            ),
            body: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    decoration: InputDecoration(
                        label: Text('Title'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    maxLines: 1,
                    maxLength: 40,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        label: Text('Content'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    maxLines: 10,
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
