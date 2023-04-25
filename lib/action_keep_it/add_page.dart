import 'package:flutter/material.dart';
import 'package:my_keep_it/screen/UI.dart';

Future<dynamic> addNewPassword(BuildContext context, int? itemKey) async {
  var _title = TextEditingController();
  var _password = TextEditingController();

  if (itemKey != null) {
    final existingItem =
        listHive.firstWhere((element) => element['key'] == itemKey);
    _title.text = existingItem['name'];
    _password.text = existingItem['password'];
  }

  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Add information'),
      actions: [
        Container(
          width: 300,
          height: 200,
          child: Column(
            children: [
              //title
              TextField(
                controller: _title,
                decoration: InputDecoration(hintText: 'Title'),
              ),
              SizedBox(
                height: 20,
              ),
              //password
              TextField(
                controller: _password,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel')),
            const SizedBox(
              width: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (itemKey == null) {
                    createItem(
                        {'title': _title.text, 'password': _password.text});
                  }

                  if (itemKey != null) {
                    updateItem(itemKey,
                        {'title': _title.text, 'password': _password.text});
                  }
                  Navigator.of(context).pop();
                },
                child: const Text('Save')),
          ],
        )
      ],
    ),
  );
}
